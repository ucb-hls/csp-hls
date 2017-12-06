#include <hls_stream.h>
typedef uint64_t UINT64_C;
typedef uint64_t T;
typedef hls::stream<T> FIFO;
T fifo_read(FIFO *fifo) {
  return fifo->read();
}

void fifo_write(FIFO *fifo, T data) {
  fifo->write(data);
}

