#!/bin/bash

#  Title: Script to execute mutiple commands in multiple servers at a time
#
#
#  Description: Bash script useful for running multiple commands
#               on multiple servers at a time. The Servers on which
#               script needs to be executed is placed in one file
#              (One server in each line and can include IP addresses as well)
#               and is passed as an argument to the script. The
#               commands which needs to be executed on the servers is
#               also placed in seperate file and will be passed as an
#               argument to the script.
#
#
# Version:      1.1
# Author:       B Gopal
# Usage: ./multiServerExec.sh <Servers File> <Command File>
#
#


t=1
c=0
if [[ -z $1 ]] || [[ -z $2 ]]
then
  echo "incorrect format for execution... Correct Format: ./scriptforqa <servers file> <command file>"
else
    n=$(cat $2 | wc -l)
    for z in $(cat $2)
    do
      if (( $t <= $n ))
      then
         Command=$(sed -n ''$t'p' $2)
         if [[ -z $Command ]]
         then
             echo "Please Enter Valid Command"
         elif [[ $Command == *shutdown* ]] || [[ $Command == *reboot* ]]
         then
             echo "Harmful command '$Command' is not allowed to be executed by the script ... exiting"
             exit 1
         else
             i=0
             echo " "
             echo -e "\033[0;33m ******************** $Command ******************** \033[0m"
             echo " "
             for x in $(cat $1)
             do
                ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -q -l root $x "uname -n;echo -e '\033[0;32m ----------------------------------- \033[0m';$Command;echo -e '\033[0;32m ----------------------------------- \033[0m'" || echo -e "$x \n \033[0;32m ----------------------------------- \033[0m \n \033[0;31m Failed connecting to $x, Please rectify the problem \033[0m \n \033[0;32m ----------------------------------- \033[0m"
                echo " "
             done
             echo -e "\033[41m %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% \033[0m"
          fi
      fi
      (( t = t + 1 ))
    done
fi
