(( ${+commands[kn]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[kn]:-"$(${commands[asdf]} which kn 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_kn
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'kn'. Regenerated completions."
  fi
} ${0:h}
