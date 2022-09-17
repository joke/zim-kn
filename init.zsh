(( ${+commands[kn]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[kn]:-"$(${commands[asdf]} which kn 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_kn
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completions zsh >| $compfile
    zimfw check-dumpfile
  fi
} ${0:h}
