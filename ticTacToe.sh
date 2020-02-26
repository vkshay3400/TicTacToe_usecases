#!/bin/bash

echo "*************************TicTacToe*************************"

# CONSTANTS
SIGN=0
BOARD_KEYS=9

# STORE IN ARRAY
declare -a board

# INITIAL BOARD VALUES
for (( index1=1; index1<=BOARD_KEYS; index1++ ))
do
	board[index1]="0"
done

# FUNCTION TO GET BOARD
function getBoard(){
echo "--------------------"
echo " | " ${board[1]} " | " ${board[2]} " | " ${board[3]} " | "
echo "--------------------"
echo " | " ${board[4]} " | " ${board[5]} " | " ${board[6]} " | "
echo "--------------------"
echo " | " ${board[7]} " | " ${board[8]} " | " ${board[9]} " | "
echo "--------------------"
}
getBoard

# FUNCTION FOR TOSS
function toss(){
randomToss=$((RANDOM%2))
echo "RandToss :"$randomToss
if [ $randomToss -eq $SIGN ]
then
	echo "Player 1 wins toss"
	player1Choice=X
	player2Choice=O
else
	echo "Player2 wins toss"
	player1Choice=O
   player2Choice=X
fi
}

# FUNCTION TO CHECK EMPTY PLACE
function isEmpty(){
	local position=$1
	local playerChoice=$2
	if [[ "${board[$position]}" == "0" ]]
	then
		board[$position]=$playerChoice
		echo $((board[$position]))
	else
		echo "Enter again"
		#board[$position1]=$player1Choice
	fi
}

# FUNCTION FOR BOARD
function board(){
toss
for (( index2=1; index2<=5; index2++))
do
	read -p "Player1 enter a position:" position1
	isEmpty $position1 $player1Choice
	getBoard
	read -p "Player2 enter a position:" position2
	isEmpty $position2 $player2Choice
	getBoard
done
}

# CALL FUNCTION
board
