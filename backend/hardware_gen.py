#!/usr/bin/python

import json
import sys
import ast
from jinja2 import Environment, FileSystemLoader, Template

# fill in all Go numeric types ...
def get_bitwidth(typ):
    if typ == "int8":
        return 8
    if typ == "int16":
        return 16
    if typ == "int32":
        return 32
    if typ == "int64":
        return 64
    if typ == "int":
        return 32
    return 32

def main(argv):
    chan_file = argv[0]
    hls_config_file = argv[1]
    hls_config = json.load(open(hls_config_file))
    print(hls_config)

    config = {
        "processes" : [],
        "fifo": []
    }
    # list of functions which will be synthesized to hardware
    list_processes = []

    # list of channels which will be synthesized to hardware
    list_fifos = []
    read_dev_cnt = 0
    write_dev_cnt = 0

    with open(chan_file, "r") as f:
        for line in f:
            data = json.loads(line)
            channel = data["channel"]
            func = data["function"]
            operation = ast.literal_eval(data["operation"])
            c = channel.split(" ")
            #func_name = func.replace(".", "_OC_")
            func_name = func
            direction = None
            print("Channel: ", c)
            print("Func: ", func)
            print("Op: ", operation)
            fifo_name = None
            for op in operation:
                proc = op[0]
                if op[1] == "made":
                    fifo_name = op[2].split(" ")[1]
                    fifo_depth = int(op[2].split(" ")[0].split(":")[0])
                    fifo_bitwidth = \
                        get_bitwidth(op[2].split(" ")[0].split(":")[1])

                    if not any(d["name"] == fifo_name for d in list_fifos):
                        fifo_dict = {}
                        fifo_dict["name"] = fifo_name
                        fifo_dict["read"] = []
                        fifo_dict["write"] = []
                        fifo_dict["depth"] = fifo_depth
                        fifo_dict["bitwidth"] = fifo_bitwidth
                        fifo_dict["is_hardware"] = True
                        list_fifos.append(fifo_dict)

                #proc_name = proc.replace(".", "_OC_")
                proc_name = proc
                if not any(d["name"] == proc_name for d in list_processes):
                    if proc in hls_config["hls_func"]:
                        new_d = {}
                        new_d["name"] = proc_name
                        new_d["list_param"] = []
                        list_processes.append(new_d)

                if proc == func:
                    is_hardware = proc in hls_config["hls_func"]
                    device_file = None
                    if op[1] == "received":
                        direction = "read"
                        if not is_hardware:
                            device_file = "read" + str(read_dev_cnt)
                            read_dev_cnt = read_dev_cnt + 1
                    else:
                        direction = "write"
                        if not is_hardware:
                            device_file = "write" + str(write_dev_cnt)
                            write_dev_cnt = write_dev_cnt + 1

                    for fifo_dict in list_fifos:
                        if fifo_dict["name"] == fifo_name:
                            d = { "name": proc_name,
                                  "is_hardware": is_hardware,
                                  "device_file" : device_file}
                            fifo_dict[direction].append(d)

            for d in list_processes:
                if d["name"] == func_name and c[0] == "parameter":
                    if any(s["name"] == c[1] for s in d["list_param"]):
                        continue

                    new_d = {}
                    new_d["name"] = c[1]
                    new_d["bitwidth"] = get_bitwidth(c[4])
                    new_d["direction"] = direction
                    new_d["fifo"] = fifo_name
                    d["list_param"].append(new_d)
    
    config["processes"] = list_processes
    config["fifos"] = list_fifos
    print(config["processes"])
    print(list_fifos)
    template_dir = "./"
    template_env = Environment(loader = FileSystemLoader(template_dir))
    template = template_env.get_template('xillydemo.v.jinja')
    f = open('xillydemo.v', 'w')
    f.write(template.render(config))
    f.close()

if __name__ == "__main__":
    main(sys.argv[1:])
