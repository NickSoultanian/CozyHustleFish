extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true

#constructor
func _init():
	velo = Vector2(-100,0)
	possibleCombos = [
		["right", "down", "up", "down", "up", "right", "left", "right"],
		["left", "up", "left", "right", "up", "down", "down", "right"],
		["right", "right", "up", "down", "down", "down", "down", "up"],
		["left", "up", "right", "down", "left", "up", "left", "right"]
	]
	pointValue = 1000
	animation = "fishSix"
