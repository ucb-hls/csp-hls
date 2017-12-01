#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
  int i = 0;
  int channel_1, channel_3, channel_4;
  uint32_t data_send, data_recv;

  channel_1 = open("/dev/xillybus_write0_32", O_WRONLY);
  channel_3 = open("/dev/xillybus_read0_32", O_RDONLY);
  channel_4 = open("/dev/xillybus_write1_32", O_WRONLY);

  printf("status: %d %d %d\n", channel_1, channel_3, channel_4); fflush(stdout);
  for (i = 0; i < 5; i++) {
    data_send = i * i + 1;
    write(channel_1, (void *) &data_send, sizeof(data_send));
    printf("[channel1] Wrote %d to FPGA\n", data_send); fflush(stdout);
  }

  for (i = 5; i < 10; i++) {
    data_send = i * i + 1;
    write(channel_4, (void *) &data_send, sizeof(data_send));
    printf("[channel4] Wrote %d to FPGA\n", data_send); fflush(stdout);
  }

  for (i = 0; i < 10; i++) {
    read(channel_3, (void *) &data_recv, sizeof(data_recv));
    printf("[channel3] Read from FPGA %d\n", data_recv); fflush(stdout);
  }

  close(channel_1);
  close(channel_3);
  close(channel_4);
  return 0;
}
