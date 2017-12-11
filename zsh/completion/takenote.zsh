#compdef takenote

# _takenote() {
#    local state
#
# _arguments \
#   '1: :->csi'\

_takenote_entry() {
  local -a entries

  entries=(${${${${(f)"$(_call_program takenote-entry takenote list)"}#[[:space:]]##}/:[[:space:]]##/:}%:[[:space:]]#})
  _describe -t takenote-entry 'takenote entry' entries "$@"
}

local -a args reply
args=(
  /$'[^\0]#\0'/
)

_regex_words \
  commands "takenote command" \
  'list:ls takenote list all' \
  'clear:cls takenote2 cls all'
args+=("$reply[@]")

_regex_arguments _takenote "${args[@]}"
#zle -N my-widget
#zle -N dummy
_takenote "$@"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
