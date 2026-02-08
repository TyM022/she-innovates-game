extends Node

# for debt traker
var debtStart = 1000 
var curDebt = 1000

var startBal = 200 # start level with 200$ to spend
var curBal = 200

func startLevel():
	curBal = startBal

func finishLevel(leftovers):
	curDebt -= leftovers #subtract leftovers after levels
	
	if curDebt < 0:
		curDebt = 0
	
