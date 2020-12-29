#!/bin/bash

function usage {
  echo
  echo "Usage:"
  echo "       # fix this typo on all files inside src/"
  echo "       xfr src/ ligght light # fix this typo on all files inside src/"
  echo
}

if [[ $# -eq 1 ]]; then
  egrep -rl $1 .
  exit
elif [[ $# -eq 3 ]]; then
  where="$1"
  term="$2"
  repl="$3"
else
  usage
  exit
fi

egrep -rl $term $where | xargs -I@ sed -i '' "s/$term/$repl/g" @
