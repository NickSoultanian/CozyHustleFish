extends CharacterBody2D

# adjust player spped 
const speed = 5000
const reelbackspeed = 15000
const isHook = true 
var returning = false
var can_move = true
var isComboRight = false

@onready var hook_animation = $AnimatedSprite2D

var starting_position = Vector2()

func _ready():
	starting_position = position # Vector2(0, -625)
	# print("from hook", starting_position.y)
	
func _physics_process(delta):
	if can_move:
		player_movement(delta)
		
	check_collision(delta)
	hook_animation.play("idle")
	# print(hook.position.y," : ", starting_position.y)
	
	
	while returning:
		var direction = (starting_position - position).normalized()
		position += direction * speed * delta
		
		if position.y <= starting_position.y:
			position.y = starting_position.y
			returning = false  # Stop moving when close to target
			print("Reached target position")

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
	
func check_collision(delta):	
	var collision_info = move_and_collide(velocity * delta, false, 0.08, true)
	var success = false
	if collision_info:
		
		if collision_info.get_collider().get("isFish") == true:
			velocity = Vector2.ZERO
			position.y -= 10
			# Stuff that happens once fish hits hook AKA start combo game here
			print("Fish hit hook")
			FishGlobal.emit_fish_caught()
			#collision_info.get_collider().queue_free()
		
			# we need to find out if the this ddr was succesfull or not. Ask dunstan.
			can_move = false
			isComboRight = await $Camera2D/ComboWindow.startCombo(["up", "down", "left", "right", "up", "down", "left", "right"])
			print(isComboRight)
			can_move = true
			
		#if the hook gets hit by bad things.
		elif collision_info.get_collider().get("isBoot") == true:
			velocity = Vector2.ZERO
			position.y -= 10
			#queue_free()
			# Stuff that happens once fish hits hook AKA start combo game here
			print("Boot hit hook")
			FishGlobal.emit_boot_caught()
			#collision_info.get_collider().queue_free()
			# we need to find out if the this ddr was succesfull or not. Ask dunstan.
			can_move = false
			isComboRight = await $Camera2D/ComboWindow.startCombo(["up", "down", "left", "right", "up", "down", "left", "right"])
			print(isComboRight)
			can_move = true
			
			# LOGIC TBD
			returning = true
			
		#if the hook gets hit by even worse things AKA shark
		elif collision_info.get_collider().get("isShark") == true:
			velocity = Vector2.ZERO
			position.y -= 10
			# Stuff that happens once fish hits hook AKA start combo game here
			print("Shark hit hook")
			#FishGlobal.emit_boot_caught()
			#collision_info.get_collider().queue_free()
			# we need to find out if the this ddr was succesfull or not. Ask dunstan.
			#can_move = false
			#await $Camera2D/ComboWindow.startCombo(["up", "down", "left", "right", "up", "down", "left", "right"])
			#can_move = true
			
			returning = true
