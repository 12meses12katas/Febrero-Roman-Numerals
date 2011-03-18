#include <stdio.h>
#include "maintest.h"


void print_result ( test_s* test, int rc )
{
  printf ( "%-50s", test->description);
  if (rc)
    printf ( "FAIL: %d", rc);
  else
    printf ("OK");
  printf ("\n");
}

void executeTests()
{
  test_s* test_list;
  test_s* test;
  parameters_t* parameters;

  test_list = getTests();

  for (test = test_list; test->function; ++test)
    {
      parameters = setUp();
      print_result ( test, test->function (parameters) );
      tearDown(parameters);
    }
  freeTests ( test_list);
}


int main ()
{
  executeTests();

  return 0;
}
