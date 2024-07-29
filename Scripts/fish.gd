extends CharacterBody2D

var velo = Vector2(-100,0)
const isFish = true

func _physics_process(delta):
	fish_movement(delta)

func fish_movement(delta):
	var collision_info = move_and_collide(velo * delta)
	if collision_info:
		velo = -velo
		$Fish.flip_h = !$Fish.flip_h
