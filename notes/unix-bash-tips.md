# Hack-Bash-Tips.Md

----------------------------------------- 
Grabbed from [Ten Things I Wish I’d Known About bash][1]

1)  ` `` ` vs `$()`
-------------------

These two operators do the same thing. Compare these two lines:

```bash
$ echo \`ls\`
$ echo $(ls)
```

Why these two forms existed confused me for a long time.

If you don’t know, both forms substitute the output of the command contained within it into the command.
The principal difference is that nesting is simpler.

Which of these is easier to read (and write)?
```bash
$ echo `echo \`echo \\\`echo inside\\\`\``
```

or:

```bash
$ echo $(echo $(echo $(echo inside)))
```

If you’re interested in going deeper, see [here](http://mywiki.wooledge.org/BashFAQ/082) or [here](https://stackoverflow.com/questions/4708549/what-is-the-difference-between-command-and-command-in-shell-programming).

2) globbing vs regexps
----------------------

Another one that can confuse if never thought about or researched.

While globs and regexps can look similar, they are not the same.

Consider this command:

```bash
$ rename -n 's/(.*)/new$1$2/' *
```

The two asterisks are interpreted in different ways.

The first is ignored by the shell (because it is in quotes), and is interpreted as ‘0 or more characters’ by the rename application. So it’s interpreted as a regular expression.

The second is interpreted by the shell (because it is not in quotes), and gets replaced by a list of all the files in the current working folder. It is interpreted as a glob.

So by looking at `man bash` can you figure out why these two commands produce different output?

```bash
$ ls *
$ ls .*
```

The second looks even more like a regular expression. But it isn’t!

3) Exit Codes
-------------

Not everyone knows that every time you run a shell command in bash, an ‘exit code’ is returned to bash.

Generally, if a command ‘succeeds’ you get an error code of `0`. If it doesn’t succeed, you get a non-zero code. `1` is a ‘general error’, and others can give you more information (eg which signal killed it, for example).

But these rules don’t always hold:

$ grep not_there /dev/null
$ echo $?

`$?` is a special bash variable that’s set to the exit code of each command after it runs.

Grep uses exit codes to indicate whether it matched or not. I have to look up every time which way round it goes: does finding a match or not return `0`?

Grok this and a lot will click into place in what follows.

4) `if` statements, `[` and `[[`
--------------------------------

Here’s another ‘spot the difference’ similar to the backticks one above.

What will this output?
```bash
if grep not_there /dev/null
then
    echo hi
else
    echo lo
fi
```
grep’s return code makes code like this work more intuitively as a side effect of its use of exit codes.

Now what will this output?
```
a) `hihi`  
b) `lolo`  
c) something else
```

```bash
if \[ $(grep not_there /dev/null) = '' \]
then
    echo -n hi
else
    echo -n lo
fi
if \[\[ $(grep not_there /dev/null) = '' \]\]
then
    echo -n hi
else
    echo -n lo
fi
```

The difference between `[` and `[[` was another thing I never really understood. `[` is the original form for tests, and then `[[` was introduced, which is more flexible and intuitive. In the first `if` block above, the if statement barfs because the `$(grep not_there /dev/null)` is evaluated to nothing, resulting in this comparison:

`[ = '' ]`

which makes no sense. The double bracket form handles this for you.

This is why you occasionally see comparisons like this in bash scripts:

`if [ x$(grep not_there /dev/null) = 'x' ]`

so that if the command returns nothing it still runs.

5) `set`s
---------

Bash has configurable options which can be set on the fly. I use two of these all the time:

```bash
set -e
```

exits from a script if any command returned a non-zero exit code (see above).

This outputs the commands that get run as they run:

```bash
set -x
```

So a script might start like this:

```bash
#!/bin/bash
set -e
set -x
grep not_there /dev/null
echo $?
```

What would that script output?

```
6) <()
```

------

This is my favourite. It’s so under-used, perhaps because it can be initially baffling, but I use it all the time.

It’s similar to `$()` in that the output of the command inside is re-used.

In this case, though, the output is treated as a file. This file can be used as an argument to commands that take files as an argument.

Confused? Here’s an example.

Have you ever done something like this?

```bash
$ grep somestring file1 > /tmp/a
$ grep somestring file2 > /tmp/b
$ diff /tmp/a /tmp/b
```

That works, but instead you can write:

```bash
diff <(grep somestring file1) <(grep somestring file2)
```

Isn’t that neater?

7) quoting
----------

Quoting’s a knotty subject in bash, as it is in many software contexts.

Firstly, variables in quotes:

```bash
A='123'  echo "$A" echo '$A'
```

Pretty simple – double quotes dereference variables, while single quotes go literal.

So what will this output?

```bash
mkdir -p tmp
cd tmp
touch a
echo "*"
echo '*'
```

Surprised? I was.

8) Top three shortcuts
----------------------

There are plenty of shortcuts listed in `man bash`, and it’s not hard to find comprehensive lists. This list consists of the ones I use most often, in order of how often I use them.

Rather than trying to memorize them all, I recommend picking one, and trying to remember to use it until it becomes unconscious. Then take the next one. I’ll skip over the most obvious ones (eg `!!` – repeat last command, and `~` – your home directory).

```bash
`**!$**`
```

I use this dozens of times a day. It repeats the last argument of the last command. If you’re working on a file, and can’t be bothered to re-type it command after command it can save a lot of work:

```bash
grep somestring /long/path/to/some/file/or/other.txt
vi !$

​​**`!:1-$`**
```

This bit of magic takes this further. It takes all the arguments to the previous command and drops them in. So:

```bash
grep isthere /long/path/to/some/file/or/other.txt
egrep !:1-$
fgrep !:1-$
```

The `!` means ‘look at the previous command’, the `:` is a separator, and the `1` means ‘take the first word’, the `-` means ‘until’ and the `$` means ‘the last word’.

`**:h**`

I use this one a lot too. If you put it after a filename, it will change that filename to remove everything up to the folder. Like this:

grep isthere /long/path/to/some/file/or/other.txt
ls /long/path/to/some/file/or/other.txt:h

Combine it with other shortcuts and you can do cool things like this:

grep isthere /long/path/to/some/file/or/other.txt
cd !$:h

which can save a lot of work in the course of the day.

9) startup order
----------------

The order in which bash runs startup scripts can cause a lot of head-scratching. I keep this diagram handy:

![shell-startup-actual](https://zwischenzugs.files.wordpress.com/2018/01/shell-startup-actual.png?w=840)

It shows which scripts bash decides to run from the top, based on decisions made about the context bash is running in (which decides the colour to follow).

So if you are in a local (non-remote), non-login, interactive shell (eg when you run bash itself from the command line), you are on the ‘green’ line, and these are the order of files read:

```bash
/etc/bash.bashrc
~/.bashrc
\[bash runs, then terminates\]
~/.bash_logout
```

This can save you a hell of a lot of time debugging.

10) getopts (cheapci)
---------------------

If you go deep with bash, you might end up writing chunky utilities in it. If you do, then getting to grips with `getopts` can pay large dividends.

For fun, I once wrote a [script](https://github.com/ianmiell/cheapci/blob/master/cheapci) called `cheapci` which I used to work like a Jenkins job.

The code [here](https://github.com/ianmiell/cheapci/blob/master/cheapci#L70-L96) implements the reading of the [two required, and 14 non-required arguments](https://github.com/ianmiell/cheapci/blob/master/cheapci#L33-L51). Better to learn this than to build up a bunch of bespoke code that can get very messy pretty quickly as your utility grows.

11) printf
--------------------
See the following reference: [Bash Hackers Wiki - The printf command](http://wiki.bash-hackers.org/commands/builtin/printf)


* * *

**This is based on some of the contents of my book** [Learn Bash the Hard Way](https://leanpub.com/learnbashthehardway), available at [$5](https://leanpub.com/learnbashthehardway):

[![hero](https://zwischenzugs.files.wordpress.com/2018/01/hero.png?w=188&h=300)](https://leanpub.com/learnbashthehardway)


[1]: https://zwischenzugs.com/2018/01/06/ten-things-i-wish-id-known-about-bash/

-----------------------------------------
2018-01-06 19:01:25
