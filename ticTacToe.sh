#!/bin/bash

echo "*************************TicTacToe*************************"

# DECLARING BOARD
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
