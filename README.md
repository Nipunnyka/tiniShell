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
or if you need to read inour by fgets() run `make tiniShell_r` instead.

3. Run `./tiniShell` or `./tiniShell_r` depending on previous command

## Basic Functions and Architecture of tiniShell

Basic framewok of any shell can summarized as (code from [Modern Operating Systems](https://www.amazon.com/Modern-Operating-Systems-Andrew-Tanenbaum/dp/013359162X)) :
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
To get the layout that we generally see in CLIs such as: 
![Image of Linux Terminal](/images/ss1.png) 
we have the `type_prompt.c` which uses commands like getuid() gethostname() and getcwd() to obtain a similar looking layout:
![Image of type prompt of tiniShell](/images/ss2.png)

### Reading commands
`read_command.c` reads input and differentiates it into command and parameters. Since I use fgets() backspace is ineffective but this issue will be rectified at a later time. This is where the processing of input strings happens.

UPDATE:
using a buffered readLine now without fgets to avoid memory leak, no need to worry for dynamic memory allocation but this functionality requires libreadline5-dev. To facilitate debugging user still has the option to choose what kind of input they require. For fgets() `make tiniShell_r` should be used.

### Built in Commands
Built in Commands are required because commands like cd, pushd, exit, history, export etc cannot exist as executable commands inside a child an need to be built into the shell using system calls (example:`chdir()` for `cd`). The analysis and processing of builtin commands should be a function of the interpreter so the main function has to be modified as follows:
```c
if (buildin_command(command,parameters))
     continue ;
```
The following commands are built into tiniShell with proper error handling: `cd`, `exit`,`quit`, and `about`. Their implementation can be found in `builtin_command.c`.
![ss of builtin cmds](/images/ss3.png)

## Advanced Functions: Background Execution I/O redirection and piping
I would not go into details about how these function are implemented but would only document their proper usage.
Note: My interpreter is not robust and only handles legal input
* Background Processing:
![ss of bg exec](/images/ss4.png)
* I/O Redirection:
![ss of io redirection](/images/ss5.png)
* Piping:
![ss of piping](/images/ss6.png)



