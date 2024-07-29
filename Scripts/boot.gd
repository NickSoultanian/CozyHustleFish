extends CharacterBody2D

var velo = Vector2(500,0)
const isBoot = true

func _physics_process(delta):
	boot_movement(delta)

func boot_movement(delta):
	
	var collision_info = move_and_collide(velo * delta)
	# Code for detecting when fish hits hook
	if collision_info:
		# print(collision_info.get_collider().get("isHook"))
		if collision_info.get_collider().get("isHook") == true:
			#queue_free()
			# Stuff that happens once fish hits hook AKA start combo game here
			FishGlobal.emit_boot_caught()
			print("Boot hit hook")
		velo = -velo
