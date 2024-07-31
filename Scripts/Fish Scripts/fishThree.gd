extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true

#constructor
func _init():
	velo = Vector2(-100,0)
	possibleCombos = [
		["left", "up", "right", "down", "up"],
		["right", "left", "up", "down", "right"],
		["down", "up", "left", "right", "down"],
		["up", "down", "left", "up", "right"]
	]
	pointValue = 300
	animation = "fishThree"
	species = 3
	winScreen = preload("res://Art Assets/Finished Art/catch popups/FishThreeWinscreen.png")
