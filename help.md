# My dot files 
templates. To view markdown file the alias uses a terminal markdown viewer
This guide goes through what aliases are available by using the provided
called mdp (https://github.com/visit1985/mdp).
    - mac: brew install mdp
    - debian: sudo apt-get install libncursesw10 libncurses-devel
    - Rasp: sudo apt-get install libncurses5-dev libncursesw5-dev

## vim

Commands

command                     |   description   
---[ files and buffers]-----|--------------------------------------------------
ctrl + right/left arrow     |   move to next or previous buffer
,,                          |   toggle previous buffer
:bd                         |   close current buffer
,q                          |   delete current buffer and move on
:vert help e                |   show help in vertical mode
:vsp                        |   open another file in vertical
:vsp ~/.zshrc               |   open another file in vertical
:set splitright             |   set files to open in right
:vsp#2                      |   vertical split
                            |
----[ spell checker ]-------|--------------------------------------------------
,s                          |   toggle spell checker
z=                          |   show the suggestions
zg                          |   add to dictionary
                            |
------[ white space ]-------|--------------------------------------------------
set list                    |   show listchars including tab
set nolist                  |   hide listchars including tab
:w !sudo tee %              |   save file with sudo privileges
                            |
--[ function key mapping ]--|--------------------------------------------------
F2                          |   toggle paste
F3                          |   Toggle nerd tree¬
F4                          |   Toggle highlight 
F5                          |   Toggle list invisible characters like tabs 
                            |
-----[ miscellaneous ]------|--------------------------------------------------
gc                          |   Toggle comment for the selected text or block
g>                          |   Toggle comment for the selected text or block
                            |
----------------------------|--------------------------------------------------
## Custom aliases:

aliases             | Desc
--------------------|--------------------------------------------------
                    | 
**Help Pages**      | 
                    |
help                | Displays this help page.
h                   | Grep history for a specific keyword
zdoc                | Opens zsh pdf document.
                    |
**App Openers**     | 
                    |
idea                | Opens a file or folder in IntelliJ Idea
subl                | Opens a file or folder in sublime texteditor
atom                | Opens a file or folder in atom texteditor
                    |
--------------------|--------------------------------------------------
**Operations**      | 
                    | 
ds                  | Calculates subfolder sizes in a directory 
                    | **EQ:**  to 'du -hd 1'
ex                  | Make a file executable
                    | **EQ:** eq. to 'chmod u+x'
rgrep               | Search current folder for a specific keyword including all subfolders 
                    | **Usage:** $ rgrep alias 
                    | **EQ:** grep --color=always -R -i "$1" * | less; 
rfind               | Search current folder for a specific filename including all subfolders
                    | **Usage:** $ rfind mac.sh 
                    | **EQ:** find . -iname "*$1*"|grep -i "$1" --color=always
**Web Search**      | 
                    | 
google              | Search Google for a specific term
ddg                 | Search DuckDuckGo for a specific term
ducky               | Search DuckDuckGo for a specific term (I'm feeling lucky)
bing                | Search Bing for a specific term
wiki                | Search Wikipedia for a specific term
youtube             | Search Youtube for a specific term
news                | Search Google news for a specific term
map                 | Search Google maps for a specific term
image               | Search images.google.com for a specific term

