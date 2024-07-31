extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true

#constructor
func _init():
	velo = Vector2(-1100,0)
	possibleCombos = [
		["down", "right", "right", "down"],
		["left", "up", "left", "down"],
		["left", "up", "right", "up"],
		["up", "right", "left", "left"],
	]
	pointValue = 150
	animation = "fishTwo"
	species = 2
	winScreen = preload("res://Art Assets/Finished Art/catch popups/FishTwoWinscreen.png")
