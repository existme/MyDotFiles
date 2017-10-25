#compdef dummy

_dummy() {
   local state

_arguments \
  '1: :->csi'\

case $state in
  csi)
     _arguments '::(
      --current-song
      --current-song-filename
      --help
      --playlist-addurl)'
  ;;
esac

   # zle backward-word
}
#zle -N my-widget
#zle -N dummy
_dummy "$@"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
