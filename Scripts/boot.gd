extends CharacterBody2D

var velo = Vector2(500,0)
const isBoot = true

func _physics_process(delta):
	boot_movement(delta)

func boot_movement(delta):
	var collision_info = move_and_collide(velo * delta)
	if collision_info:
		velo = -velo
