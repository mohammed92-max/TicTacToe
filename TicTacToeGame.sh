#!/bin/bash -x

echo ""
echo "Welcome to the Tic tac toe game"
echo "2 players: x and o in which first x then o."
winsx=0
winso=0
ngames=0

while true
do
  ngames=`expr $ngames + 1`													# incrementing number of games
  declare -a sq
  sq=(1 2 3 4 5 6 7 8 9)														# initial positions of board
  echo ""
  echo "Current Grid:"
  echo "-------------"
  echo "| ${sq[0]} | ${sq[1]} | ${sq[2]} |"
  echo "-------------"
  echo "| ${sq[3]} | ${sq[4]} | ${sq[5]} |"
  echo "-------------"
  echo "| ${sq[6]} | ${sq[7]} | ${sq[8]} |"
  echo "-------------"
  echo ""
  win=0
  i=1
  winx="x x x"
  wino="o o o"

	while [ $win -eq 0 ]
   do
   	echo "Displaying status of squares: ${sq[*]}"
      sqNox=`echo ${sq[*]#x*}`
      sqNoxo=`echo ${sqNox//o/''}`
      rtChoice=0

		while [ $rtChoice -eq 0 ]
    	do
      	entryCode=0

			while [ "$entryCode" -eq 0 ];
      	do
         	echo "squares remained: $sqNoxo"

				if [ `expr $i % 2` != 0 ];  										# User enters 1st entry
				then
          		echo "Enter for x?"
            else
               echo "Enter for o?"
            fi

				read entry


				if [ "$entry" = "1" -o  "$entry" = 2 -o "$entry" = "3" -o  "$entry" = "4" -o "$entry" = "5" -o  "$entry" = "6" -o "$entry" = "7" -o  "$entry" = "8" -o "$entry" = "9" ]; 
				then
          		entryCode=1
            else
               echo "Entered wrong \"$entry\". Enter again"
               entryCode=0
            fi
      	done
																					# checking non filled places
      	if [ "${sq[${entry}-1]}" = "x" -o "${sq[${entry}-1]}" = "o"  ];
			then
        		echo "Square ${entry} is already filled"
      	else
        		rtChoice=1
      	fi
    	done

		if [ `expr $i % 2` != 0 ];
		then       										 						# Steps of player X is 1,3,5,7,9
      	sq[${entry}-1]="x"                   						# assigning x to choice entry
      	echo ""
      	echo "Current Grid:"                 						# modified grid
      	echo "-------------"
      	echo "| ${sq[0]} | ${sq[1]} | ${sq[2]} |"
      	echo "-------------"
      	echo "| ${sq[3]} | ${sq[4]} | ${sq[5]} |"
      	echo "-------------"
      	echo "| ${sq[6]} | ${sq[7]} | ${sq[8]} |"
      	echo "-------------"
      	echo ""

			wr1="${sq[0]} ${sq[1]} ${sq[2]}"     						# finding 8 patterns
      	wr2="${sq[3]} ${sq[4]} ${sq[5]}"								# wr - winning row
      	wr3="${sq[6]} ${sq[7]} ${sq[8]}"								# wc - winning column
      	wc1="${sq[0]} ${sq[3]} ${sq[6]}"								# wd - winning diagonal
      	wc2="${sq[1]} ${sq[4]} ${sq[7]}"
      	wc3="${sq[2]} ${sq[5]} ${sq[8]}"
      	wd1="${sq[0]} ${sq[4]} ${sq[8]}"
      	wd2="${sq[2]} ${sq[4]} ${sq[6]}"     						# comparing 8 patterns to winx patterns

			if [ "$wr1" = "$winx" -o "$wr2"  = "$winx" -o "$wr3" = "$winx" ]; 
			then
        		echo "X wins"
        		echo ""
        		winsx=`expr $winsx + 1`

			elif [ "$wc1" = "$winx" -o "$wc2" = "$winx" -o "$wc3" = "$winx" -o "$wd1" = "$winx" -o "$wd2" = "$winx" ]; 
			then
       		echo "X wins"
        		echo ""
        		win=1
        		winsx=`expr $winsx + 1`
      	fi

			i=`expr $i + 1`                       						# incrementing step i
      	if [ $i -ge 10 -a $win = 0 ];									# condition to check no one is winner
			then
		  	##	echo "No winner"
        		echo ""
        		win=1                              						# putting win=1 to end current game
      	fi

		else
      	sq[${entry}-1]="o"                   						# Steps for player O are 2,4,6,8
      	echo ""
      	echo "Current Grid:"                 						# modified grid
      	echo "-------------"
      	echo "| ${sq[0]} | ${sq[1]} | ${sq[2]} |"
      	echo "-------------"
      	echo "| ${sq[3]} | ${sq[4]} | ${sq[5]} |"
      	echo "-------------"
      	echo "| ${sq[6]} | ${sq[7]} | ${sq[8]} |"
      	echo "-------------"
      	echo ""
      
			wr1="${sq[0]} ${sq[1]} ${sq[2]}"
      	wr2="${sq[3]} ${sq[4]} ${sq[5]}"
      	wr3="${sq[6]} ${sq[7]} ${sq[8]}"
      	wc1="${sq[0]} ${sq[3]} ${sq[6]}"
      	wc2="${sq[1]} ${sq[4]} ${sq[7]}"
      	wc3="${sq[2]} ${sq[5]} ${sq[8]}"
      	wd1="${sq[0]} ${sq[4]} ${sq[8]}"
      	wd2="${sq[2]} ${sq[4]} ${sq[6]}"

			if [ "$wr1" = "$wino" -o "$wr2"  = "$wino" -o "$wr3" = "$wino" ];
			then
         	echo "O wins"
        		echo ""
        		win=1
        		winso=`expr $winso + 1`

			elif [ "$wc1" = "$wino" -o "$wc2" = "$wino" -o "$wc3" = "$wino" -o "$wd1" = "$wino" -o "$wd2" = "$wino" ]; 
			then
         	echo "O wins"
        		echo ""
        		win=1
        		winso=`expr $winso + 1`
      	fi
      	i=`expr $i + 1`                      							# increment step i
    	fi
  done

  		echo "Current score:"
  		echo "  Total games played: $ngames"
  		echo "  X wins: $winsx"
  		echo "  O wins: $winso"
  		echo "Another game?[Y/n]"
  		read no

		if [ "$no" = "n" -o "$no" = "N" -o "$no" = "no" -o "$no" = "No" ];
		then
    		echo ""
    		echo "THANK YOU"
    	exit
  		else
    		echo "*** New Game ***"
  		fi
done






