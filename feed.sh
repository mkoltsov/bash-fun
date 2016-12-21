#!/bin/bash
# This script acts upon the exit status given by penguin.sh
                                                                                                 
export menu="$1"
export animal="$2"
                                                                                                 
feed="./penguin.sh"
                                                                                                 
$feed $menu $animal
                                                                                                 
case $? in
                                                                                                 
1)
  echo "Guard: You'd better give'm a fish, less they get violent..."
  ;;
2)
  echo "Guard: It's because of people like you that they are leaving earth all the time..."
  ;;
3)
  echo "Guard: Buy the food that the Zoo provides for the animals, you ***, how
do you think we survive?"
  ;;
*)
  echo "Guard: Don't forget the guide!"
  ;;
esac