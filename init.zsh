(( ${+commands[kn]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[kn]:-"$(${commands[asdf]} which kn 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_kn
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion zsh >| $compfile

} ${0:h}
