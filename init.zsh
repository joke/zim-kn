local command="${commands[kn]:-${commands[asdf]:+$(asdf which kn)}}"

if (( ! ${+command} )); then
  return 1
fi

local compfile=${0:h}/functions/_kn
if [[ ! -e $compfile || $compfile -ot $command ]]; then
  $command completion zsh >| $compfile
fi
