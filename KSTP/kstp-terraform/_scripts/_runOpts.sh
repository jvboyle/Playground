#!/bin/bash

#HOW TO USE
#Simply add the following line to your .bashrc file
#source /path/to/your-CNAS-terraform/_scripts/_runOpts.sh
_runOpts ()  
{
  local cur

  COMPREPLY=()   # Array variable storing the possible completions.
  cur=${COMP_WORDS[COMP_CWORD]}
  case "$cur" in
    -*)
    COMPREPLY=( $( compgen -W '--project --gen_tf \
                               --parse_stage --clean' -- $cur ) );;
    *)
    prev=${COMP_WORDS[COMP_CWORD - 1]}
    case "$prev" in
      --gen_tf)
            COMPREPLY=( $( compgen -W 'Y N' -- $cur ) );;
      --parse_stage)
            COMPREPLY=( $( compgen -W '1 2' -- $cur ) );;
      --clean)
            COMPREPLY=( $( compgen -W 'Y N' -- $cur ) );;
      --project)
            projects=$(find "${PWD}/" -maxdepth 1 -type d -exec basename \{} \;)
            
            COMPREPLY=( $( compgen -W "${projects[*]}" -- $cur ) );;
    esac
  esac

  return 0
}

complete -F _runOpts ./run.sh
