#include <iostream>
#include <hls_stream.h>

void process1(hls::stream<int> &in, hls::stream<int> &out) {
#pragma HLS STREAM variable=in depth=10
#pragma HLS STREAM variable=out depth=10
#pragma HLS INTERFACE port=return s_axilite

  for (int i = 0; i < 10; i++) {
    int item;
    in.read(item);
    out.write(item * 2 + 1);
  }
}

void process2(hls::stream<int> &in, hls::stream<int> &out) {
#pragma HLS STREAM variable=in depth=10
#pragma HLS STREAM variable=out depth=10
#pragma HLS INTERFACE port=return s_axilite

  for (int i = 0; i < 10; i++) {
    int item;
    in.read(item);
    out.write((item - 1) / 2);
  }
}

int main() {
  hls::stream<int> c1, c2, c3;
  for (int i = 0; i < 10; i++)
    c1.write(i * i);

  process1(c1, c2);
  process2(c2, c3);

  for (int i = 0; i < 10; i++) {
    int x;
    c3.read(x);
    std::cout << x << '\n';
  }
  return 0;
}
