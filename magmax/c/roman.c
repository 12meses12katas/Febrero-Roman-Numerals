#include <stdlib.h>
#include <string.h>
#include "roman.h"


char* concatenate_and_free_target (char* origin, char* target )
{
  char* result;

  result = calloc (strlen(origin) + strlen(target) + 1, 1);

  strcpy (result, origin);
  strcat (result, target);

  free (target);

  return result;
}

char* to_roman (int i)
{
  char* result = calloc ( i+1, 1 );

  if (i >= 5)
    return concatenate_and_free_target( "V", to_roman(i-5) );

  if (i == 4)
    return strdup ( "IV" );

  memset (result, 'I', i);
  return result;
}

void  free_roman (char* roman)
{
  free (roman);
}
