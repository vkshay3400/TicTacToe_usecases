#!/bin/bash -x

echo "*************************TicTacToe*************************"

# CONSTANTS
ROWS=3
COLUMNS=3
BOARD_POSITION=9
HEAD=1
TAIL=0

# VARIABLES
playerTurn=false
winner=false
compWinMove=false
turn=0
computerP=0
playerP=0
nonEmptyCount=1

# STORE IN ARRAY
declare -a board

# FUNCTION FOR BOARD INITAILISE
function boardInitialize(){
	for (( index=1 ; index<=$BOARD_POSITION; index++ ))
	do
		board[$index]=0
	done
}

# DISPLAY BOARD
function  displayBoard(){
	echo " ------------- "
	echo " | "${board[1]}" | "${board[2]}" | "${board[3]}" | "
	echo " ------------- "
	echo " | "${board[4]}" | "${board[5]}" | "${board[6]}" | "
	echo " ------------- "
	echo " | "${board[7]}" | "${board[8]}" | "${board[9]}" | "
	echo " ------------- "
}

# HORIZONTAL CHECK
function checkHorizontal(){
	local position=1
	counter=1
	while [ $counter -le $ROWS ]
	do
		if [[ ${board[$position]} == ${board[$position+1]} ]] && [[ ${board[$position+1]} == ${board[$position+2]} ]] && [[ ${board[$position+2]} == $1 ]]
		then
			displayBoard
			echo "$1 wins"
			winner=true
			break
		else
			position=$(( $position+$ROWS ))
		fi
	counter=$(( $counter+1 ))
	done
}

# VERTICAL CHECK
function checkVertical(){
	position=1
	counter=1
	while [ $counter -le $ROWS ]
	do
		if [[ ${board[$position]} == ${board[$position+3]} ]] && [[ ${board[$position+3]}  ==  ${board[$position+6]} ]] && [[ ${board[$position+6]} == $1 ]]
		then
			displayBoard
			echo "$1 Wins"
			winner=true
			break
		else
			position=$(( $position+1 ))
		fi
	counter=$(( $counter+1 ))
	done
}

# DIAGONAL CHECK
function checkDiagonal(){
	position=1
	counter=1
	while [ $counter -le 2 ]
	do
		if [[ ${board[$position]} == ${board[$position+4]} ]] && [[ ${board[$position+4]}  ==  ${board[$position+8]} ]] && [[ ${board[$position+8]} == $1 ]]
		then
			displayBoard
			echo " $1 wins "
			winner=true
			break
		elif [[ ${board[$position+2]} == ${board[$position+4]} ]] && [[  ${board[$position+4]}  ==  ${board[$position+6]} ]] && [[ ${board[$position+6]} == $1 ]]
		then
			displayBoard
			echo " $1 wins "
			winner=true
			break
		fi
		counter=$(($counter+1))
	done
}

# CHECK TIE CASE
function checkTie(){
	while [ ${board[$nonEmptyCount]} != 0 ]
	do
		if [ $nonEmptyCount -eq $BOARD_POSITION ]
		then
			displayBoard
			echo "Game is tie"
			winner=true
			break
		else
			nonEmptyCount=$(($nonEmptyCount+1))
		fi
	done
}

# CHECK WINNING MOVE
function checkWinningMove(){
	counter=1
	winMove=false
	for (( index=1; index<=3; index++ ))
	do
		if [[ ${board[$counter]} == ${board[$counter+$1+$1]} ]] && [[ ${board[$counter+$1]} == 0 ]] &&[[ ${board[$counter]} == $computer ]]
		then
			computerP=$(( $counter+$1 ))
			echo "Winning move is " $computerP
			board[$computerP]=$computer
			winMove=true
			break
		elif [[ ${board[$counter]} == ${board[$counter+$1]} ]] && [[ ${board[$counter+$1+$1]} == 0 ]] && [[ ${board[$counter]} == $computer ]]
		then
			computerP=$(( $counter+$1+$1 ))
			echo "Winning move is " $computerP
			board[$computerP]=$computer
			winMove=true
			break
		elif [[ ${board[$counter+$1]} == ${board[$counter+$1+$1]} ]] && [[ ${board[$counter]} == 0 ]] && [[ ${board[$counter+$1]} == $computer ]]
		then
			computerP=$counter
			echo "Winning move is " $computerP
			board[$computerP]=$computer
			winMove=true
			break
		fi
	counter=$(( $counter+$2 ))
	done
}

# USER INPUT
function userInput() {
	row=1
	column=3
	winMovePlayer=false
	read -p "Enter you position in between 1 to 9: " POSITION
	if [ $winMovePlayer == false ]
	then
		if [ ${board[$POSITION]} -eq $TAIL ]
		then
			echo "Player turn"
			board[$POSITION]=$player
			displayBoard
			turn=$(( $turn + 1 ))
		else
			echo "Invalid input"
         userInput
		fi
	fi
	playerTurn=false
}

# COMPUTER INPUT
function computerInput(){
	row=1
	column=3
	winMove=false
	echo "Computer is Playing"
	checkWinningMove $row $column
	checkWinningMove $column $row
	POSITION=$((RANDOM%9+1))
	if [ $winMove == false ]
	then
		if [ ${board[$POSITION]} == $TAIL ]
		then
			board[$POSITION]=$computer
		else
			echo "Wrong move "
			computerInput
		fi
	fi
	playerTurn=true
}

# FUNCTION FOR TIC TAC TOE
function ticTacToe(){
	checkingToss=$((RANDOM%2))
	if [[ $checkingToss -eq $HEAD ]]
	then
		playerTurn=true
		player='X'
		computer='O'
		echo "Player will play first"
		displayBoard
	else
		player='X'
		computer='O'
		echo "Computer will play first"
	fi
}

# FUNCTION CALL
boardInitialize
ticTacToe

# CHECK WHO WINS
while [ $winner == false ]
do
	displayBoard
	if [ $playerTurn == true ]
	then
		userInput
		checkHorizontal $player
		checkVertical $player
		checkDiagonal $player
		checkTie $player
	else
		computerInput
		checkHorizontal $computer
      checkVertical $computer
  		checkDiagonal $computer
		checkTie $computer
	fi
done
