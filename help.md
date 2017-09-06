# 1. My dot files 
templates. To view markdown file the alias uses a terminal markdown viewer
This guide goes through what aliases are available by using the provided
called mdp (https://github.com/visit1985/mdp).
    - mac: brew install mdp
    - debian: sudo apt-get install libncursesw10 libncurses-devel
    - Rasp: sudo apt-get install libncurses5-dev libncursesw5-dev

## 1.1. vim
to open several files in split mode use:

vim -O *.txt

or

vim -O ~/.zshrc ~/zshrc.local.sh

Commands

| command                      | description                                                         |
|------------------------------|---------------------------------------------------------------------|
| --[ files and buffers ]--    |                                                                     |
| ctrl + right/left arrow      | move to next or previous buffer                                     |
| ,,                           | toggle previous buffer                                              |
| :bd                          | close current buffer                                                |
| ,q                           | delete current buffer and move on                                   |
| :vert help e                 | show help in vertical mode                                          |
| :vsp                         | open another file in vertical                                       |
| :vsp ~/.zshrc                | open another file in vertical                                       |
| :set splitright              | set files to open in right                                          |
| :vsp#2                       | vertical split                                                      |
| --[ Buffer manipulation ]--  |                                                                     |
| :bn                          | next buffer                                                         |
| :Ctrl+w                      | set width (ex. 50<C-w>_)                                            |
| :Ctrl+w =                    | equalize width and height of all windows                            |
| :help CTRL-W                 | See also                                                            |
| ,q                           | delete current buffer and move on                                   |
| --[ search & replace ]--     |                                                                     |
| :%s/foo/bar/g                | replaces foo with bar in all lines                                  |
| :s/foo/bar/g                 | replaces foo with bar only in current line                          |
| :%s/foo/bar/gc               | replaces all foos with bar but asks each time                       |
| :%s/\<foo\>/bar/gc           | replaces all exact "foo"s with "bar" with confirmation              |
| :%s/foo/bar/gci              | (case insensitive) replaces all "foo"s with "bar" with confirmation |
| :set ignorecase              | make all searches case insensitive                                  |
| --[ Key mapping ]--          |                                                                     |
| :verbose imap <tab>          | Show where the kepmap is defined and in which file/plugin           |
| :scripts                     | Shows all effective scripts                                         |
| --[ Syntax Highlighter ]--   |                                                                     |
| :set syntax=yaml             | for wrong or unknown types you can manually set syntax              |
| --[ spell checker ]--        |                                                                     |
| ,s                           | toggle spell checker                                                |
| z=                           | show the suggestions                                                |
| zg                           | add to dictionary                                                   |
| --[ white space ]--          |                                                                     |
| set list                     | show listchars including tab                                        |
| set nolist                   | hide listchars including tab                                        |
| :w !sudo tee %               | save file with sudo privileges                                      |
| --[ function key mapping ]-- |                                                                     |
| F2                           | toggle paste ~/paste                                                |
| F3                           | Toggle nerd tree                                                    |
| F4                           | Toggle highlight                                                    |
| F5                           | Toggle list invisible characters like tabs                          |
| F6                           | Toggle showing the line numbers                                     |
| --[ miscellaneous ]--        |                                                                     |
| gc                           | Toggle comment for the selected text or block                       |
| g>                           | Toggle comment for the selected text or block                       |
| set nonumber                 | Hide line numbers                                                   |
| set number                   | Show line numbers                                                   |
| .                            | Auto compilation                                                    |
| :w!!                         | Vim sudo trick or :w !sudo tee > /dev/null %                        |
| <ctrl>o                      | Vim sudo trick or :w !sudo tee > /dev/null %                        |

## 1.2. Vifm


| command                  | description                             |
|--------------------------|-----------------------------------------|
| --[    Preview       ]-- |                                         |
| w                        | Preview on the alternate pane           |
| e                        | Preview on the current pane             |
| q                        | Quit preview                            |
| CTRL+w z                 | Quit all preview modes                  |
| SHIFT+TAB                | Switch to preview tab inorder to scroll |

## 1.3. ZSH tricks

| aliases              | Desc                                                   |
|----------------------|--------------------------------------------------------|
|                      |                                                        |
| **Escape Sequences** |                                                        |
| Esc-.(period)        | Insert the last argument of the previous command line. |
| .                    | Repeat to retrieve arguments from earlier lines.       |

## 1.4. Custom aliases:

| aliases                | Desc                                                         |
|------------------------|--------------------------------------------------------------|
| **Help Pages**         |                                                              |
| help                   | Displays this help page.                                     |
| h                      | Grep history for a specific keyword                          |
| zdoc                   | Opens zsh pdf document.                                      |
| **App Openers**        |                                                              |
| idea                   | Opens a file or folder in IntelliJ Idea                      |
| subl                   | Opens a file or folder in sublime texteditor                 |
| atom                   | Opens a file or folder in atom texteditor                    |
| **Operations**         |                                                              |
| ds                     | Calculates subfolder sizes in a directory                    |
| .                      | **EQ:**  to 'du -hd 1'                                       |
| Make a file executable |                                                              |
| .                      | **EQ:** eq. to `chmod u+x'                                   |
| rgrep                  | Search current folder for a specific keyword                 |
| .                      | including all subfolders                                     |
| .                      | **Usage:** $ rgrep alias                                     |
| .                      | **EQ:** `grep --color=always -R -i "$1" ‖ less;`             |
| rfind                  |                                                              |
| .                      | **Usage:** `$ rfind mac.sh`                                  |
| .                      | **EQ:** `find . -iname "*$1*" ‖ grep -i "$1" --color=always` |
| dq                     | query installed packages and list their files                |
| **Usage:** $ dq ls     |                                                              |
| extract                | extracts a file into the destination folder using `tar`      |
| .                      | **Usage:** `$ extract x.tar "/your/destination"`             |
| .                      | **EQ:Usage:** `tar xf $1 -C $2;`                             |
| **Web Search**         |                                                              |
| google                 | Search Google for a specific term                            |
| ddg                    | Search DuckDuckGo for a specific term                        |
| ducky                  | Search DuckDuckGo for a specific term (I'm feeling lucky)    |
| bing                   | Search Bing for a specific term                              |
| wiki                   | Search Wikipedia for a specific term                         |
| youtube                | Search Youtube for a specific term                           |
| news                   | Search Google news for a specific term                       |
| map                    | Search Google maps for a specific term                       |
| image                  | Search images.google.com for a specific term                 |

