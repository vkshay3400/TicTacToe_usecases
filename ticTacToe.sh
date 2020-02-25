#!/bin/bash

echo "*************************TicTacToe*************************"

# CONSTANT
SIGN=0

# RESETTING THE BOARD
declare -A board

# DISPLAY BOARD
function getBoard(){
echo " | " ${board[1]} " | " ${board[2]} " | " ${board[3]} " | "
echo "------------------"
echo " | " ${board[4]} " | " ${board[5]} " | " ${board[6]} " | "
echo "------------------"
echo " | " ${board[7]} " | " ${board[8]} " | " ${board[9]} " | "
echo "------------------"
}

# FUNCTION TO ASSIGN PLAYER
function playerAssign(){
randomToss1=$((RANDOM%2))
if [ $randomToss1 -eq $SIGN ]
then
	echo Player=X
else
	echo Player=0
fi
}
playerAssign
