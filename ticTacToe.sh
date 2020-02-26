#!/bin/bash

echo "*************************TicTacToe*************************"

# CONSTANT
SIGN=0

# RESETTING THE BOARD
declare -A board

# CONSTANT
SIGN=0

# DISPLAY BOARD
function getBoard(){
echo " | " ${board[1]} " | " ${board[2]} " | " ${board[3]} " | "
echo "---------------------"
echo " | " ${board[4]} " | " ${board[5]} " | " ${board[6]} " | "
echo "---------------------"
echo " | " ${board[7]} " | " ${board[8]} " | " ${board[9]} " | "
echo "---------------------"
}

# TOSS
function getToss(){
   randomToss=$((RANDOM%2))
   if [ $randomToss -eq 1 ]
   then
		toss=1
      echo "Player1 win toss"
   else
      toss=0
      echo "Player2 win toss"
   fi
}

# FUNCTION FOR ASSIGNING THE PLAYER
function playerAssign(){
getToss $toss
if [ $toss -eq $SIGN ]
then
	Player1=0
	Player2=X
else
	Player1=X
	Player2=0
fi
}

# FUNCTION CALL
playerAssign
