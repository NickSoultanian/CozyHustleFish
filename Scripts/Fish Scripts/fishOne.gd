extends "res://Scripts/Fish Scripts/fish.gd"

const isFish = true
@onready var player_animation = $AnimatedSprite2D

#constructor
func _init():
	print("Constructed base fish with no override")
	velo = Vector2(-100,0)
	possibleCombos = [
		["up", "down", "up"],
		["left", "right", "up"],
		["left", "down", "up"],
		["right", "right", "down"],
	]
	pointValue = 80
