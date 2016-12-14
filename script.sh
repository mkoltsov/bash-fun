echo 1
RT="122323"
set

#!/bin/bash

# positional.sh
# This script reads 3 positional parameters and prints them out.

POSPAR1="$1"
POSPAR2="$2"
POSPAR3="$3"

echo "$1 is the first positional parameter, \$1."
echo "$2 is the second positional parameter, \$2."
echo "$3 is the third positional parameter, \$3."
echo
echo "The total number of positional parameters is $#."

date=20021226

echo $date

echo \$date
echo sp{el,il,al}l

 echo $FRANKY

 echo ${FRANKY:=Franky}
echo $[365*24]

alias dh='df -h'
set -o