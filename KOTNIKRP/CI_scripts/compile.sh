#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/compiler
cd "$(dirname "$0")/../.."
python3 mta/tools/build_kotnik_amx.py \
  --source-root KOTNIKRP \
  --compiler ~/compiler/pawncc
