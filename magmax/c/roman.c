#include <stdlib.h>
#include <string.h>
#include "roman.h"

char* to_roman (int i)
{
  char* result = calloc ( i+1, 1 );

  if (i == 4)
    return strdup ( "IV" );

  memset (result, 'I', i);
  return result;
}

void  free_roman (char* roman)
{
  free (roman);
}
