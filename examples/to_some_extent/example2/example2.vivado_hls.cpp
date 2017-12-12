#include <iostream>
#include <hls_stream.h>

void process1(hls::stream<int> &in, hls::stream<int> &out) {
#pragma HLS INTERFACE port=in ap_fifo
#pragma HLS INTERFACE port=out ap_fifo
#pragma HLS INTERFACE port=return ap_ctrl_none

  for (int i = 0; i < 5; i++) {
    int item;
    in.read(item);
    out.write(item * 2 + 1);
  }
}

void process2(hls::stream<int> &in, hls::stream<int> &out) {
#pragma HLS INTERFACE port=in ap_fifo
#pragma HLS INTERFACE port=out ap_fifo
#pragma HLS INTERFACE port=return ap_ctrl_none

  for (int i = 0; i < 5; i++) {
    int item;
    in.read(item);
    out.write(item * 2 + 1);
  }
}

void process3(hls::stream<int> &in, hls::stream<int> &out) {
#pragma HLS INTERFACE port=in ap_fifo
#pragma HLS INTERFACE port=out ap_fifo
#pragma HLS INTERFACE port=return ap_ctrl_none

  for (int i = 0; i < 10; i++) {
    int item;
    in.read(item);
    out.write((item - 1) / 2);
  }
}

int main() {
  hls::stream<int> c1, c2, c3, c4;
  for (int i = 0; i < 5; i++)
    c1.write(i * i);

  for (int i = 5; i < 10; i++)
    c4.write(i * i);

  process1(c1, c2);
  process2(c4, c2);
  process3(c2, c3);

  for (int i = 0; i < 10; i++) {
    int x;
    c3.read(x);
    std::cout << x << '\n';
  }
  return 0;
}
