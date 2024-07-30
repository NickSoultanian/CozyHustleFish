extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true

#constructor
func _init():
	print("Constructed base fish with no override")
	velo = Vector2(-100,0)
	possibleCombos = [
		["left", "up", "right", "down", "up"],
		["right", "left", "up", "down", "right"],
		["down", "up", "left", "right", "down"],
		["up", "down", "left", "up", "right"]
	]
	pointValue = 300
