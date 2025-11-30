#!/usr/bin/env bash

echo "running this command will overwrite your existing dotfiles."
echo -n "are you sure you want to do this? (y/N): "

declare input
read input

if [[ "$input" == 'n' || "$input" == 'N' ]]; then
  exit 0
elif [[ -n "$input" && "$input" != 'y' && "$input" != 'Y' ]]; then
  echo "error: invalid input. will not overwrite existing dotfiles." >&2
  exit 1
fi

find ./.dotfiles/ ! -wholename '*/.git/*' ! -wholename '*/.dotfiles.scripts/*' -type f -exec cp -f {} ~ \;

if [[ $? != 0 ]]; then
    "error: failed to create/write dotfiles"
    exit 1
fi

echo "successfully created/wrote dotfiles"
