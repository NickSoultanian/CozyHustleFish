extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true

#constructor
func _init():
	velo = Vector2(-100,0)
	possibleCombos = [
		["down", "right", "right", "down"],
		["left", "up", "left", "down"],
		["left", "up", "right", "up"],
		["up", "right", "left", "left"],
	]
	pointValue = 150
