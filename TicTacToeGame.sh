#!/bin/bash -x

echo ""
echo "Welcome to Tic Tac Toe game"

winsx=0
winso=0

declare -a sq
sq=(1 2 3 4 5 6 7 8 9)

echo ""
echo "Tic Tac Toe Board"
echo "-------------"
echo "| ${sq[0]} | ${sq[1]} | ${sq[2]} |"
echo "-------------"
echo "| ${sq[3]} | ${sq[4]} | ${sq[5]} |"
echo "-------------"
echo "| ${sq[6]} | ${sq[7]} | ${sq[8]} |"
echo "-------------"
echo ""

toss=$((RANDOM%2));
turn1=0;
turn2=1;
if [[ $toss -eq $turn1 ]]
then
        echo "1st chance : User"
else
        echo "1st chance : Computer"
fi

