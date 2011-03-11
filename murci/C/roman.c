#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include "roman.h"

typedef struct {
  char*  text;
  int    text_len;
  int    value;
} s_ROMAN_DIGIT;

s_ROMAN_DIGIT _roman_digits[] = {
  { "M",  1, 1000 },
  { "CM", 2,  900 },
  { "D",  1,  500 },
  { "CD", 2,  400 },
  { "C",  1,  100 },
  { "XC", 2,   90 },
  { "L",  1,   50 },
  { "XL", 2,   40 },
  { "X",  1,   10 },
  { "IX", 2,    9 },
  { "V",  1,    5 },
  { "IV", 2,    4 },
  { "I",  1,    1 }
};

#define N_ROMAN_DIGITS 13 


/*
  returns newly allocated string, NULL if error
*/
char*
itoroman(int value) {
  int i, j;
  int div, mod;
  char *roman;

  if ((value < ROMAN_MIN_LIMIT) && (value > ROMAN_MAX_LIMIT)) {
    return NULL;
  }

  // create new string
  roman = (char*)calloc(64, sizeof(char));
  
  for (i = 0; i < N_ROMAN_DIGITS; i++) {
    div = value / _roman_digits[i].value;
    mod = value % _roman_digits[i].value;
    for (j = 0; j < div; j++) {
      strcat(roman, _roman_digits[i].text);
    }
    value = mod;
  } 

  return roman;
}

/*
  returns greater than 0 number, -2 (negative) if error
  
  TODO: check correct order of input string digits (i.e. no M after L)
 */
int
romantoi(char *roman) {
  int i, j;
  int value = 0;
  int no_digit = 0;

  while (*roman) {
    if (no_digit) {
      return ERR_ROMAN_BADSTRING;
    }
    no_digit = 1;
    for (i = 0; i < N_ROMAN_DIGITS; i++) {
      if (!strncmp(roman, _roman_digits[i].text, _roman_digits[i].text_len)) {
        value += _roman_digits[i].value; 
        roman += _roman_digits[i].text_len;
        no_digit = 0;
        continue;
      }
    }
  }
  return value;
}
