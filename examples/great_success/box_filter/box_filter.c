#include <stdio.h>
#define NUM_ROWS 256
#define NUM_COLS 256

int main() {

  int i, j;
  int item1, item2, item3;
  int image[NUM_ROWS][NUM_COLS]; // image
  int blurx[NUM_ROWS][NUM_COLS];
  int blury[NUM_ROWS][NUM_COLS]; // result
  for (i = 0; i < NUM_ROWS; i++) {
    for (j = 0; j < NUM_COLS; j++) {
      image[i][j] = (i + j) % 255;
    }
  }

  // blurx
  for (i = 0; i < NUM_ROWS; i++) {
    for (j = 0; j < NUM_COLS; j++) {
      if (j == 0)
        item1 = 0;
      else
        item1 = image[i][j - 1];
      item2 = image[i][j];
      if (j == NUM_COLS - 1)
        item3 = 0;
      else
        item3 = image[i][j + 1];
      blurx[i][j] = (item1 + item2 + item3) / 3;
    }
  }

  // blury
  for (i = 0; i < NUM_ROWS; i++) {
    for (j = 0; j < NUM_COLS; j++) {
      if (i == 0)
        item1 = 0;
      else
        item1 = blurx[i - 1][j];
      item2 = blurx[i][j];
      if (i == NUM_ROWS - 1)
        item3 = 0;
      else
        item3 = blurx[i + 1][j];

      blury[i][j] = (item1 + item2 + item3) / 3;
    }
  }

//  printf("Image:\n");
//  for (i = 0; i < NUM_ROWS; i++) {
//    for (j = 0; j < NUM_COLS; j++) {
//      printf("%d ", image[i][j]);
//    }
//    printf("\n");
//  }
//
//  printf("Blurx:\n");
//  for (i = 0; i < NUM_ROWS; i++) {
//    for (j = 0; j < NUM_COLS; j++) {
//      printf("%d ", blurx[i][j]);
//    }
//    printf("\n");
//  }
//
//  printf("Blury:\n");
//  for (i = 0; i < NUM_ROWS; i++) {
//    for (j = 0; j < NUM_COLS; j++) {
//      printf("%d ", blury[i][j]);
//    }
//    printf("\n");
//  }

  int checksum = 0;
  for (i = 0; i < NUM_ROWS; i++) {
    for (j = 0; j < NUM_COLS; j++) {
      checksum += blury[i][j];
    }
  }
  printf("Checksum: %d\n", checksum);

}
