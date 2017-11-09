#!/bin/bash

_goenv_complete()
{
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  prev2="${COMP_WORDS[COMP_CWORD-2]}"
  case "$prev" in
    "goenv")
      COMPREPLY=( $(compgen -W "$(goenv commands)" -- ${cur}) )
      ;;
    "use"|"create"|"remove"|"rm"|"rename")
      COMPREPLY=( $(compgen -W "$(goenv envs)" -- ${cur}) )
      ;;
  esac
  return 0
}

complete -F _goenv_complete goenv

