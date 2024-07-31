extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true

#constructor
func _init():
	velo = Vector2(-900,0)
	possibleCombos = [
		["right", "up", "down", "down", "right", "down"],
		["left", "left", "up", "down", "up", "right"],
		["right", "up", "right", "up", "down", "right"],
		["up", "up", "left", "down", "left", "right"]
	]
	pointValue = 200
	animation = "fishFour"
	species = 4
	winScreen = preload("res://Art Assets/Finished Art/catch popups/FishFourWinscreen.png")
