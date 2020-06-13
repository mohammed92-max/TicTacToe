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

	 ##return
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
}



function init()
{
   movesPlayer="";
   override=0;
   wins={{7,8,9},{4,5,6},{1,2,3},{7,4,1},{8,5,2},{9,6,3},{7,5,3},{9,5,1}};

   weights={{3,2,3,2,4,2,3,2,3};
   grid=new char[][]{{'','',''},{'','',''},{'','',''}};
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

function fixWeights()
{
   for (( i=0; i<3; i++ ))
   do
      for(( j=0; j<3; j++ ))
      do
         if [[ marks[i][j] -eq 1 ]]
         then
            if [[ weights[wins[i][j]-1]!=MIN_INT ]]
            then
               weights[wins[i][j]-1]=MIN_INT;
            fi
         fi
      done
   done

   for (( i=0; i<8; i++ ))
   do
         if [[ marks[i][totalcount]! -eq 2 ]]
         then
            continue;
         fi

         if [[ marks[i][crosscount] -eq 2 ]]
         then
            p=i;
            q=-1;


            if [[ marks[i][0] -eq 0 ]]
            then
               q=0;
            elif [[ marks[i][1] -eq 0 ]]
            then
               q=1;
            elif [[ marks[i][2] -eq 0 ]]
            then
               q=2;
            fi

            if [[ weights[wins[p][q]-1] -ne Integer.min_value ]]
            then
               weights[wins[p][q]-1]=6;
            fi
         fi

      if [[ marks[i][knotcount] -eq 2 ]]
      then
         p=i;
         q=-1;

         if [[ marks[i][0] -eq 0 ]]
         then
            q=0;
         elif [[ marks[i][1] -eq 0 ]]
         then
            q=1;
         elif [[ marks[i][2] -eq 0 ]]
         then
            q=2;
         fi

         if [[ weights[wins[p][q]-1] -eq Integer.min_value   ]]
         then
            weights[wins[p][q]-1]=5;
         fi
      fi

   done
}

function playerMove()
{
   echo "What is your move?"
   cell=0;
   okay=0;

   while(( $okay -eq 0 ))
   do
      if [[ cell -lt 1 || cell -gt 9 ]] || [[ weights[cell-1] -eq MIN_INT ]]
      then
         echo "Invalid move"
      else
         okay=1;
      fi
   done
                                                   ## finding cell parameter & passing it to playerMoved()
   $(playerMoved $cell);
   echo ""
   return cell;

}

function playerMoved()
{
   local $cell=$1;
   movesPlayer=$movesPlayer+$cell;
   $(mark $cell 0);
   fixWeights
   $(put $cell 0);
}

function checkForWin()
{
   crossFlag=0;
   knotFlag=0;

   for (( i=0; i<wins.length; i++ ))
   do
      if [[ wins[i][0] ]]
      then
         if [[ wins[i][1] ]]
         then
            if [[ wins[i][2] ]]
            then
               $crossFlag=1;
               break;
            fi
         fi
      fi

      if [[ wins[i][0] ]]
      then
         if [[ wins[i][0] ]]
         then
            if [[ wins[i][0] ]]
            then
                  $knotFlag=1;
                  break;
            fi
         fi
      fi

   done

   if [[ $knotFlag -eq 1 ]]
   then
      $(display $grid)
      echo "O wins"
      return $playerid;
   fi

   if [[ crossFlag -eq 1 ]]
   then
      $(display $grid)
      echo "X wins"
      return $compid;
   fi

   for (( i=0; i<weights.length; i++ ))
   do
      if [[ weights[i] -ne Integer.min_value ]]
      then
         return $playerid;
      fi

      echo "Truce"
   done
}


