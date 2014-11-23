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
FIN_TEST_INPUT3="./testcase3.txt"
FIN_TEST_INPUT4="./testcase4.txt"
FIN_TEST_INPUT5="./testcase5.txt"



#Set source input file path
#No error handling for no source file provided :P
SRC_FILE=$1

#Disable Automated Tests
NO_TEST=0

#Set language to grade 
LANG="python"

#Loop to gather commmand line args (e.g. -i inputfile.py, -t testcase.txt)
while getopts "si:t:l:" opt; do
  case $opt in
    s)
      NO_TEST=1
      ;;
    i)
      SRC_FILE="$OPTARG"
      ;;
    t)
      FIN_TEST_INPUT="$OPTARG"
      ;;
    l)
      LANG="$OPTARG"
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

#Exit on unsupporte dlang
if [ "python" == $LANG ] || [ "c" == "$LANG" ]
  then
   :
  else
   echo "++++===Invalid language specified===++++"
   exit
  fi

echo -e "\n+++++===File Contents===+++++"
echo "$SRC_FILE"
#Print source file contents to screen
cat "$SRC_FILE"

if [[ "$NO_TEST" -eq 1 ]]
  then
    exit
  fi

echo "+++++===Program Output===+++++"
#If test case file exists (default or provided)

if [[ "$LANG" == "c" ]]
  then
    #echo "+++++===COMPILER WARNINGS===+++++"
    gcc -o binary "$SRC_FILE"
  else
    :
  fi


if [[ -e $FIN_TEST_INPUT ]]
  then
    #Pipe file into file running in python environment
    if [[ "$LANG" == "python" ]]
      then cat "$FIN_TEST_INPUT" | python3 "$SRC_FILE"
    elif [[ "$LANG" == "c" ]]
      then cat "$FIN_TEST_INPUT" | ./"binary"
    fi
  else
    #Otherwise run without piped input (interactive)
    echo "++++===NO TEST CASE PROVIDED===++++"
    if [[ "$LANG" == "python" ]]
      then echo "$LANG"; python3 "$SRC_FILE"
    elif [[ "$LANG" == "c" ]]
      then ./"binary"
    fi
  fi
  
if [[ -e $FIN_TEST_INPUT2 ]]
   then
   if [[ "$LANG" == "python" ]]
   	then cat "$FIN_TEST_INPUT2" | python3 "$SRC_FILE"
   elif [[ "$LANG" == "c" ]]
   	then cat "$FIN_TEST_INPUT2" | ./"binary"
   fi
fi

if [[ -e $FIN_TEST_INPUT3 ]]
   then
   if [[ "$LANG" == "python" ]]
    then cat "$FIN_TEST_INPUT3" | python3 "$SRC_FILE"
   elif [[ "$LANG" == "c" ]]
    then cat "$FIN_TEST_INPUT3" | ./"binary"
   fi
fi

if [[ -e $FIN_TEST_INPUT4 ]]
   then
   if [[ "$LANG" == "python" ]]
    then cat "$FIN_TEST_INPUT4" | python3 "$SRC_FILE"
   elif [[ "$LANG" == "c" ]]
    then cat "$FIN_TEST_INPUT4" | ./"binary"
   fi
fi

if [[ -e $FIN_TEST_INPUT5 ]]
   then
   if [[ "$LANG" == "python" ]]
    then cat "$FIN_TEST_INPUT5" | python3 "$SRC_FILE"
   elif [[ "$LANG" == "c" ]]
    then cat "$FIN_TEST_INPUT5" | ./"binary"
   fi
fi

if [[ -e $FIN_TEST_INPUT6 ]]
   then
   if [[ "$LANG" == "python" ]]
    then cat "$FIN_TEST_INPUT6" | python3 "$SRC_FILE"
   elif [[ "$LANG" == "c" ]]
    then cat "$FIN_TEST_INPUT6" | ./"binary"
   fi
fi
