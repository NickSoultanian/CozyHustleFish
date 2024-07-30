extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true

#constructor
func _init():
	velo = Vector2(-100,0)
	possibleCombos = [
		["right", "right", "right", "up", "left", "left", "up"],
		["up", "up", "up", "up", "down", "right", "up"],
		["right", "right", "right", "left", "right", "left", "down"],
		["left", "left", "down", "left", "right", "down", "up"]
	]
	pointValue = 750
