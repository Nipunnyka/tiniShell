
tinishell: tinishell.h tinishell.c type_prompt.c read_command.c builtin_command.c parsing.c test
	gcc tinishell.c type_prompt.c read_command.c builtin_command.c parsing.c -o tinishell

tinishell_r: tinishell.h tinishell.c type_prompt.c read_command.c builtin_command.c parsing.c test
	gcc tinishell.c type_prompt.c read_command.c builtin_command.c parsing.c -o tinishell -D READLINE_ON -I /usr/include -lreadline -ltermcap

test: test.c
	gcc test.c -o test

clean:
	rm -f tinishell test
