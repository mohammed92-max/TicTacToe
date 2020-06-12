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
userTurn=0;
computerTurn=1;

input1=X;
input2=O;

if [[ $toss -eq $userTurn ]]
then
        echo "1st turn : User"
        echo "Choose letter X or O" read -p

        $c= `read -p`
        if [[ $c -eq $input2 ]]
        then
            echo "User has choosen O"
        elif [[ $c -eq $input1 ]]
        then
            echo "User has choosen X"
        fi

else
        echo "1st turn : Computer"
fi

