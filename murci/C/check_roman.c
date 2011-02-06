#include <stdio.h>
#include <stdlib.h>
/* use asert next time! */
#include <assert.h>
#include "roman.h"

typedef struct {
  int   arabic;
  char* roman;
} ROMAN_NUMERAL_TEST_CASE;

#define N_ROMAN_OK_TESTS 8
ROMAN_NUMERAL_TEST_CASE _roman_tests[N_ROMAN_OK_TESTS] = {
  { 4, "IV" },
  { 8, "VIII" },
  { 24, "XXIV" },
  { 31, "XXXI" },
  { 369, "CCCLXIX" },
  { 448, "CDXLVIII" },
  { 1998, "MCMXCVIII" },
  { 2751, "MMDCCLI" }
};

#define N_ROMAN_ERR_TESTS 3
ROMAN_NUMERAL_TEST_CASE _roman_err_tests[N_ROMAN_ERR_TESTS] = {
  { -1, "I a.C." },
  { 3000, "MMM" },
  { 5000, "MMMMM" }
};

int
main(void) {
  int i;
  char *roman = NULL;

  /* selected tests */
  for (i = 0; i < N_ROMAN_OK_TESTS; i++) {
    if (romantoi(_roman_tests[i].roman) != _roman_tests[i].arabic) {
      printf("romantoi failed for: %s (result was %d)\n", _roman_tests[i].roman, _roman_tests[i].arabic);
      exit(-1);
    }
  }
  
  /* selected tests */
  for (i = 0; i < N_ROMAN_OK_TESTS; i++) {
    roman = itoroman(_roman_tests[i].arabic);
    if (roman) {
      if (strcmp(roman, _roman_tests[i].roman)) {
        printf("itoroman failed for: %d (result was %s)\n", _roman_tests[i].arabic, _roman_tests[i].roman);
        free(roman);
        exit(-1);
      }
      free(roman);
    }
  }
  
  /* limit tests */
  
  
  /* reciprocal tests */
  for (i = 1; i < 3000; i++) {
    roman = itoroman(i);
    if (roman) {
      if (romantoi(roman) != i) {
        printf("romantoi/itoroman failed for: %s - %d)\n", roman, i);
        free(roman);
        exit(-1);
      }
      free(roman);
    }
  }


  printf("All tests passed!\n");  
}
