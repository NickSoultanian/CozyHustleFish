extends CharacterBody2D

var velo = Vector2(100,0)
const isFish = true

func _physics_process(delta):
	fish_movement(delta)

func fish_movement(delta):
	
	var collision_info = move_and_collide(velo * delta)
	# Code for detecting when fish hits hook
	if collision_info:
		print(collision_info.get_collider().get("isHook"))
		if collision_info.get_collider().get("isHook") == true:
			#queue_free()
			# Stuff that happens once fish hits hook AKA start combo game here
			FishGlobal.emit_fish_caught()
			print("Fish hit hook")
		velo = -velo
