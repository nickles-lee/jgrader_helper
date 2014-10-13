#!/bin/bash
#Grading Helper
#Nick Lee
#No version assigned yet

#User scripts stored in: ~/path
#Line added to .zshrc/.bashrc/.bash_profile: export PATH=$PATH:~/path
#Line adds contents of ~/path to userpath, which lets me call them from any dir with [filename]
#Script is located at ~/path/grade.sh; symlinked at ~/path/grade

#Set default test case input file path
FIN_TEST_INPUT="./testcase.txt"
FIN_TEST_INPUT2="./testcase2.txt"

#Set source input file path
#No error handling for no source file provided :P
SRC_FILE=$1

#Loop to gather commmand line args (e.g. -i inputfile.py, -t testcase.txt)
while getopts "i:t:" opt; do
  case $opt in
    i)
      SRC_FILE="$OPTARG"
      ;;
    t)
      FIN_TEST_INPUT="$OPTARG"
    ;;
   esac
done

#Exit on no valid source file
if [[ -e $SRC_FILE ]]
  then
    :
  else
    echo "++++===NO SOURCE FILE PROVIDED===++++"
    exit
  fi

echo "+++++===File Contents===+++++"
#Print source file contents to screen
cat "$SRC_FILE"


echo "+++++===Program Output===+++++"
#If test case file exists (default or provided)
if [[ -e $FIN_TEST_INPUT ]]
  then
    #Pipe file into file running in python environment
    cat "$FIN_TEST_INPUT" | python3 "$SRC_FILE"
  else
    #Otherwise run without piped input (interactive)
    echo "++++===NO TEST CASE PROVIDED===++++"
  	python3 "$SRC_FILE"
  fi
if [[ -e $FIN_TEST_INPUT2 ]]
   then
    cat "$FIN_TEST_INPUT2" | python3 "$SRC_FILE"
fi
