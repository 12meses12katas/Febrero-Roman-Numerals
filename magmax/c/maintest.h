#ifndef ROMANTEST_H
#define ROMANTEST_H

typedef void parameters_t;
typedef int (*PF_Test) (parameters_t* parameters);

typedef struct {
  PF_Test  function;
  char     description[250];
} test_s;


test_s* getTests ();
void     freeTests(test_s* tests);
parameters_t*    setUp();
void     tearDown (parameters_t* parameters);


#endif
