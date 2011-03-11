#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "roman.h"


int 
main(int argc, char** argv) {
  int n;
  char *roman;
  
  if (argc > 1) {
    n = strtol(argv[1], NULL, 10);
    if (n > 0) {
      roman = itoroman(n);
      if (roman > 0) {
        puts(roman);
        free(roman);
      } else {
        printf("%d is out-limits\n", n);
        return ERR_ROMAN_BADNUMBER;
      }
    } else if (n == 0) {
      n = romantoi(argv[1]);
      if (n > 0) {
        printf("%d\n", n);
      } else {
        printf("%s is not a valid roman numeral or is out-limits\n", argv[1]);
        return ERR_ROMAN_BADSTRING;
      }
    }
  }

  return 0;
}
