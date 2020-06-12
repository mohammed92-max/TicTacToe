echo ""
echo "Welcome to Tic Tac Toe game"

winsx=0
winso=0

while true
do

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


  echo "Current score:"
  echo "  Total games played: $ngames"
  echo "  x wins: $winsx"
  echo "  o wins: $winso"

  echo "Another game?[Y/n]"
  read no

  if [ "$no" = "n" -o "$no" = "N" -o "$no" = "no" -o "$no" = "No" ]; then
    echo ""
    echo "Here's hoping you enjoyed TICTACTOE ... the GAME!"
    echo "Try it again soon!"
    echo "THANK YOU!!!"
    exit
  else
    echo "****************"
    echo "*** New Game ***"
    echo "****************"
  fi
done
#
