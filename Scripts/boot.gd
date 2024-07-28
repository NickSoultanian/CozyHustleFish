extends CharacterBody2D

var velo = Vector2(200,0)

func _physics_process(delta):
	fish_movement(delta)

func fish_movement(delta):
	
	var collision_info = move_and_collide(velo * delta)
	if collision_info:
		velo = -velo
