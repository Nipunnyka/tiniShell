# tiniShell
* Basic Linux shell written in C using system calls with support for all bash
commands with appropriate flags, piping,foreground and background
processing
* Multiple processes are supported using multithreading

Note: no support for regex yet

## Installing tiniShell 
1. Run:
```
$ git clone https://github.com/Nipunnyka/tiniShell.git
```
2. Run:
```
$ cd tiniShell
$ make tiniShell
```
or if you need to read inour by fgets() run `make tiniShell_r` instead
3. Run `./tiniShell` or `./tiniShell_r` depending on previous command

## Basic Functions and Architecture of tiniShell

Basic framewok of any shell can summarized as (code from [Modern Operating Systems](https://www.amazon.com/Modern-Operating-Systems-Andrew-Tanenbaum/dp/013359162X) :
```c
#define TRUE 1

while (TRUE) {　　　　　　　　　　　　　　　　　  /* repeat forever */ 
　　type_prompt();　　　　　　　　　　　　　　　/* display prompt on the screen */ 
　　read_command(command,parameters);　　　  /* read input from terminal */ 
　　if (fork()!= 0 ) {　　　　　　　　　　　　　   / * the fork Child Process OFF * / 
　　　　/ * the Parent code * / 
　　　　waitpid ( - . 1 , & Status, 0 );　　　　　　　   / * the wait for Child to Exit * / 
 　　} the else {
　　　　/ * Child code * /
　　　　execve(command,parameters, 0 );　　　　/* execute command */
　　}

}
```

