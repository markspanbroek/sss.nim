#!/bin/bash
root=$(dirname "$0")

# install nimterop, if not already installed
if ! [ -x "$(command -v toast)" ]; then
  nimble install -y nimterop@0.6.13
fi

# generate nim wrapper with nimterop
toast \
  --compile="${root}/sources/randombytes.c" \
  --compile="${root}/sources/hazmat.c" \
  --pnim \
  --noHeader \
  "${root}/sources/randombytes.h" \
  "${root}/sources/hazmat.h" > "${root}/sss/cwrapper.nim"
