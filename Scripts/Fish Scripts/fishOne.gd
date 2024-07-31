extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true

#constructor
func _init():
	velo = Vector2(-100,0)
	possibleCombos = [
		["up", "down", "up"],
		["left", "right", "up"],
		["left", "down", "up"],
		["right", "right", "down"],
	]
	pointValue = 80
	animation = "fishOne"
	species = 1
	winScreen = preload("res://Art Assets/Finished Art/catch popups/FishOneWinscreen.png")
