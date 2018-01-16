# Unix-Bash-Conditional-Expressions.Md

----------------------------------------- 

## [Bash Conditional Expressions][bash-conditionals]

Conditional expressions are used by the `[[` compound command and the test and `[` builtin commands.

When used with `[[`, the `<` and `>` operators sort lexicographically using the current locale. The test command uses ASCII ordering.
Unless otherwise specified, primaries that operate on files follow symbolic links and operate on the target of the link, rather than the link itself.

conditional         | description                                                               | shell
--------------------|---------------------------------------------------------------------------|--------------------
-a file             | true if file exists.                                                      | bash/zsh
                    |                                                                           |
-b file             | true if file exists and is a block special file.                          | bash/zsh
                    |                                                                           |
-c file             | true if file exists and is a character special file.                      | bash/zsh
                    |                                                                           |
-d file             | true if file exists and is a directory.                                   | bash/zsh
                    |                                                                           |
-e file             | true if file exists.                                                      | bash/zsh
                    |                                                                           |
-f file             | true if file exists and is a regular file.                                | bash/zsh
                    |                                                                           |
-g file             | true if file exists and its set-group-id bit is set.                      | bash/zsh
                    |                                                                           |
-h file             | true if file exists and is a symbolic link.                               | bash/zsh
                    |                                                                           |
-k file             | true if file exists and its "sticky" bit is set.                          | bash/zsh
                    |                                                                           |
-p file             | true if file exists and is a named pipe (FIFO).                           | bash/zsh
                    |                                                                           |
-r file             | true if file exists and is readable.                                      | bash/zsh
                    |                                                                           |
-s file             | true if file exists and has a size greater than zero.                     | bash/zsh
                    |                                                                           |
-t fd               | true if file descriptor fd is open and refers to a terminal.              | bash/zsh
                    |                                                                           |
-u file             | true if file exists and its set-user-id bit is set.                       | bash/zsh
                    |                                                                           |
-w file             | true if file exists and is writable.                                      | bash/zsh
                    |                                                                           |
-x file             | true if file exists and is executable. If file exists and is a directory, | bash/zsh
                    | then the current process has permission to search in the directory.       | 
                    |                                                                           | 
-G file             | true if file exists and is owned by the effective group id.               | bash/zsh
                    |                                                                           |
-L file             | true if file exists and is a symbolic link.                               | bash/zsh
                    |                                                                           |
-N file             | true if file exists and has been modified since it was last read.         | bash/zsh
                    |                                                                           |
-O file             | true if file exists and is owned by the effective user id of this process.| bash/zsh
                    |                                                                           |
-S file             | true if file exists and is a socket.                                      | bash/zsh
                    |                                                                           |
file1 -ef file2     | true if file1 and file2 refer to the same file.                           | bash/zsh
                    |                                                                           |
file1 -nt file2     | true if file1 exists and is newer than file2.                             | bash/zsh
                    | (according to modification date)                                          | 
                    |                                                                           | 
file1 -ot file2     | true if file1 exists and is older than file2.                             | bash/zsh
                    |                                                                           |
-o optname          | true if the shell option optname is enabled. The list of options appears  | bash/zsh
                    | in the description of the -o option to the set builtin                    | 
                    | (see The Set  | Builtin).                                                 | 
                    |                                                                           | 
-v varname          | true if the shell variable varname is set (has been assigned a value).    | bash/zsh
                    |                                                                           |
-R varname          | true if the shell variable varname is set and is a name reference.        | bash/zsh
                    |                                                                           |
-z string           | true if the length of string is zero.                                     | bash/zsh
                    |                                                                           | 
-n string           | true if the length of string is non-zero.                                 | bash/zsh
string              |                                                                           | 
                    |                                                                           | 
string1 == string2  | True if the strings are equal. When used with the `[[` command, this      | bash
string1 =  string2  | performs pattern matching as described above (see Conditional Constructs).| 
                    | `=` should be used with the test command for POSIX conformance.           | 
                    |                                                                           | 
                    |                                                                           | 
string == pattern   | true if string matches pattern. The two forms are exactly equivalent.     | zsh
string =  pattern   | Use it with test `[[ ]]`                                                  | 
                    | ex1: `[[ "r342" == r*2 ]] && echo "true"`                                 | 
                    | ex2: `[[ r342b == r<1-3>4<1-2>b ]] && echo "true"`                        | 
                    | ex3: `[[ r342b == r<1-2>4<1-2>b ]] && echo "true" #false`                 | 
                    |                                                                           | 
string != pattern   | true if string does not match pattern.                                    | 
                    |                                                                           | 
string =~ regexp    | true if string matches the regular expression regexp.                     | zsh
                    | ex1: `[ "rea" =~ "r(e|z)a" ] && echo "true"`                              | 
                    |                                                                           | 
string1 != string2  | true if the strings are not equal.                                        | bash/zsh
                    |                                                                           | 
string1 < string2   | true if string1 sorts before string2 lexicographically.                   | bash/zsh
                    |                                                                           | 
string1 > string2   | true if string1 sorts after string2 lexicographically.                    | bash/zsh
                    |                                                                           | 
arg1 OP arg2        | OP is one of `-eq`, `-ne`, `-lt`, `-le`, `-gt`, or -`ge`                  | bash/zsh
                    | These arithmetic binary operators return true if arg1 is equal to, not    | 
                    | equal to, less than, less than or equal to, greater than, or greater than | 
                    | or equal to arg2, respectively. Arg1 and arg2 may be positive or negative | 
                    | integers.                                                                 | 
                    |                                                                           | 
( exp )             | true if exp is true.                                                      | bash/zsh
                    |                                                                           | 
! exp               | true if exp is false.                                                     | bash/zsh
                    |                                                                           | 
exp1 && exp2        | true if exp1 and exp2 are both true.                                      | bash/zsh
                    |                                                                           | 
exp1 || exp2        | true if either exp1 or exp2 is true.                                      | bash/zsh
                    |                                                                           | 
[[ $var ]]          | if there is a single argument, typically a variable, the contition is     | bash/zsh
                    | treated as a test for whether the expression expands as a string of       |
                    | non-zero length. n other words, [[ $var ]] is the same as [[ -n $var ]].  |


[bash-conditionals]: http://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html

-----------------------------------------
2018-01-15 22:18:40
