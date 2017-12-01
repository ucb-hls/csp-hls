#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
  int i = 0;
  int channel_r, channel_w;
  uint32_t data_send, data_recv;

  channel_r = open("/dev/xillybus_read_32", O_RDONLY);
  channel_w = open("/dev/xillybus_write_32", O_WRONLY);

  printf("status: %d %d\n", channel_r, channel_w); fflush(stdout);
  // Write data to the first Go process in the FPGA
  for (i = 0; i < 10; i++) {
    data_send = i * i + 10;
    write(channel_w, (void *) &data_send, sizeof(data_send));
    printf("Wrote %d to FPGA\n", data_send); fflush(stdout);
  }

  // (Assumption) Invoke Go processes in the FPGA
  // ...

  // Read data from the last Go process to CPU when available
  for (i = 0; i < 10; i++) {
    read(channel_r, (void *) &data_recv, sizeof(data_recv));
    printf("Read from FPGA %d\n", data_recv); fflush(stdout);
  }

  close(channel_r);
  close(channel_w);

  return 0;
}
