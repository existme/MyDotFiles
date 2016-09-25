# My dot files 
This guide goes through what aliases are available by using the provided
templates. To view markdown file the alias uses a terminal markdown viewer
called mdp (https://github.com/visit1985/mdp).
    - mac: brew install mdp
    - debian: sudo apt-get install libncursesw10 libncurses-devel
    - Rasp: sudo apt-get install libncurses5-dev libncursesw5-dev

## Custom aliases:

aliases             | Desc
--------------------|--------------------------------------------------
                    | 
**Help Pages**          | 
                    |
help                | Displays this help page.
h                   | Grep history for a specific keyword
zdoc                | Opens zsh pdf document.
                    |
**App Openers**         | 
                    |
idea                | Opens a file or folder in IntelliJ Idea
subl                | Opens a file or folder in sublime texteditor
atom                | Opens a file or folder in atom texteditor
                    |

---

**Operations**          | 
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
**Web Search**          | 
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






