extends "res://Scripts/Fish Scripts/fish.gd"

const isBoot = true

#constructor
func _init():
	velo = Vector2(-500,0)
	possibleCombos = [
		["up", "down"],
		["right", "up"],
		["down", "up"],
		["right", "down"],
	]
	pointValue = 0
