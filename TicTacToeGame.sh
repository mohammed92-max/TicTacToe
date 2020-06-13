#!/bin/bash -x

## Initialized variable
knotcount=3;
crosscount=4;
totalcount=5;
playerid=0;
compid=0;
truceid=2;
playingid=3;
movesPlayer=" ";

declare -a marks
declare -a wins

## Initialized grid
overridegrid={{'o','o','o'},{'o','o','o'},{'o','o','o'}};

numpad={{'7','8','9'},{'4','5','6'},{'1','2','3'}};

function startMatch()
{
   echo "Start,y or n"
   ##choice='y';
   ##choice
   ##display(numpad);
   $(display $numpad)
   echo "Begin"
   playerscore=0;
   compscore=0;

   while(( true ))
   do
      ##result=startGame();
      result="$(startGame)"

      if [[ $result == $playerid ]]
      then
            ((playerscore++));
      elif [[ $result == $compid ]]
      then
            ((compscore++));
      fi

      echo "Score player is $playerscore and computer score is $compscore"
      ##choice
   done
   ##choice
   ##echo "Game over"
}


function put()
{
   local $cell=$1
   local $player=$2

   echo "put fun start"
   i=-1;
   j=-1;
   mark='x';

   case $cell in
         $1)
            i=2;
            j=0;
            break
         ;;

          $2)
            i=2;
            j=1;
            break
         ;;

          $3)
            i=2;
            j=2;
            break
         ;;

          $4)
            i=1;
            j=0;
            break
         ;;

          $5)
            i=1;
            j=1;
            break
         ;;


          $6)
            i=1;
            j=2;
            break
         ;;

          $7)
            i=0;
            j=0;
            break
         ;;


          $8)
            i=0;
            j=1;
            break
         ;;

          $9)
            i=0;
            j=2;
            break
         ;;

         *)
            $(display $overridegrid)
         ;;

##       return
   esac

   mark='x';
   echo "start here"

   if (( $player == 0 ))
   then
      mark='o'
   fi

   grid[i][j]=$mark

   $(display $grid);
}


function startGame()
{
   init
   $(display $grid);
   status=$playingid;

   while (( $status==$playingid ))
   do
      $(put $playerMove() 0);

      if [[ $override==1 ]]
      then
         echo "o wins"
         return $playerid;
      fi

      $status=checkForWin

      if [[ $status!=$playingid ]]
      then
         break;
      fi

      $(put $compMove() 1);
      $status=checkForWin;
   done

      return $status
}


function init()
{
   movesPlayer="";
   override=0;
   ## marks=new int[8][6];
   ## wins=new int[][]

   wins={{7,8,9},{4,5,6},{1,2,3},{7,4,1},{8,5,2},{9,6,3},{7,5,3},{9,5,1}};

   weights={{3,2,3,2,4,2,3,2,3};
   grid=new char[][]{{'','',''},{'','',''},{'','',''}};
   ##crossbank
   ##knotbank
}



function display()
{
   local $grid=$1
   for (( i=0; i<3; i++ ))
   do
      echo "\n"
      echo "|"
      for (( j=0; j<3; j++ ))
      do
         echo "$grid[i][j] |"
      done
   done
   echo "\n"
}
