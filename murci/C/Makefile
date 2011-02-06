MAIN_OBJS = main.o roman.o
MAIN_EXE = roman
TEST_OBJS = check_roman.o roman.o
TEST_EXE = check_roman


$(MAIN_EXE): $(MAIN_OBJS)
	$(CC) $(MAIN_OBJS) -o $(MAIN_EXE)

$(TEST_EXE): $(TEST_OBJS)
	$(CC) $(TEST_OBJS) -o $(TEST_EXE)
	$(TEST_EXE)

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	rm -rf *o $(MAIN_EXE) $(TEST_EXE)
