#!/bin/bash

# This script prints standard output unchanged, while standard error is 
# redirected for processing by awk.

INPUTDIR="$1"

# fd 6 targets fd 1 target (console out) in current shell
exec 6>&1

# fd 1 targets pipe, fd 2 targets fd 1 target (pipe),
# fd 1 targets fd 6 target (console out), fd 6 closed, execute ls
ls "$INPUTDIR"/* 2>&1 >&6 6>&- \
				# Closes fd 6 for awk, but not for ls.

| awk 'BEGIN { FS=":" } { print "YOU HAVE NO ACCESS TO" $2 }' 6>&-

# fd 6 closed for current shell
exec 6>&-
