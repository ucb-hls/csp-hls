#!/bin/bash

DIR=xillinux-eval-zedboard-2.0a
if [ ! -d "$DIR" ]; then
  wget http://xillybus.com/downloads/xillinux-eval-zedboard-2.0a.zip
  unzip xillinux-eval-zedboard-2.0a.zip
  rm -f xillinux-eval-zedboard-2.0a.zip
fi
cp example1/src xillinux-eval-zedboard-2.0a/verilog -R
cp example1/xillydemo-vivado.tcl xillinux-eval-zedboard-2.0a/verilog
cd xillinux-eval-zedboard-2.0a/verilog
rm -rf vivado*
vivado -nolog -nojournal -m64 -mode batch -source xillydemo-vivado.tcl

