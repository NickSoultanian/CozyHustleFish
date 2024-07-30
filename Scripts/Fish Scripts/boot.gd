extends "res://Scripts/Fish Scripts/fish.gd"

const isBoot = true

func movement(delta):
	var collision_info = move_and_collide(velo * delta)
	if collision_info:
		velo = -velo

#constructor
func _init():
	velo = Vector2(500,0)
	possibleCombos = [
		["up", "down"],
		["right", "up"],
		["down", "up"],
		["right", "down"],
	]
	pointValue = 0
	animation = "boot"
