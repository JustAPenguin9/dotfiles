CFLAGS = -Wall -Wextra -Wpedantic -fsanitize=address -ggdb

out: main.c
	$(CC) $(CFLAGS) -o $@ $^

run: out
	./out

clean:
	rm -fv out
