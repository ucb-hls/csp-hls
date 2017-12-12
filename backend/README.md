# Synthesis helper scripts

## Go static analysis
godoc provides static analysis package which allows us to find information regarding channel connections in a Go benchmark. This would be helpful for the backend as to hook up Go processes and channels properly in hardware. More detail:

https://golang.org/lib/godoc/analysis/help.html

Installation:

Be sure to set the GOPATH envar first

go get golang.org/x/tools/cmd/godoc

The package can be found at $GOPATH/src/golang.org/x/tools/godoc/analysis

git apply $(PWD)/../go_static_analysis/godoc_analysis.patch $GOPATH/src/golang.org/x/tools/godoc/analysis

Example:

cd $(PWD)/../go_static_analysis

go run main.go /path/to/example/example1/example1 (path to Go code for analysis, make sure to omit ".go")

It will generate an output file chan.txt:

10:int main.main {[{{received ?s=102:104#L7} main.process1} {{sent ?s=399:401#L24} main.main}]}

10:int main.main {[{{received ?s=215:217#L14} main.process2} {{sent ?s=117:119#L8} main.process1}]}

10:int main.main {[{{sent ?s=230:232#L15} main.process2} {{received ?s=507:509#L30} main.main}]}

The first column is channel_size:channel_type. The second column is the function which a channel is made. The third one is the processes operating on this channel (send/receive).
