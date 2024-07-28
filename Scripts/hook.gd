extends CharacterBody2D

# adjust player spped 
const speed = 5000
const reelbackspeed = 15000
const isHook = true 

@onready var hook_animation = $AnimatedSprite2D

var starting_position = Vector2()

func _ready():
	starting_position = position
	# print("from hook", starting_position.y)
	
func _physics_process(delta):
	player_movement(delta)
	hook_animation.play("idle")

func player_movement(delta): 
	if Input.is_action_pressed("ui_down"):
		velocity.x = 0 
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		velocity.x = 0 
		velocity.y = -speed
	else: 
		velocity.x = 0 
		velocity.y = 0 
		
	var collision_info = move_and_collide(velocity * delta, false, 0.08, true)
	
	if collision_info:
		print(collision_info.get_collider().get("isFish"))
		if collision_info.get_collider().get("isFish") == true:
			#queue_free()
			# Stuff that happens once fish hits hook AKA start combo game here
			print("Fish hit hook")
			#collision_info.get_collider().queue_free()
			set_process_input(false)
			await $Camera2D/ComboWindow.startCombo(["up", "down", "left", "right", "up", "down", "left", "right"])
			set_process_input(true)
