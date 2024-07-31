extends CharacterBody2D

# adjust player spped 
const speed = 5000
const reelbackspeed = 15000
const isHook = true 
var returning = false
var can_move = true
var isComboRight = false
var catching = false
var player

@onready var hook_animation = $AnimatedSprite2D

var starting_position = Vector2()

func _ready():
	starting_position = position
	player = get_tree().get_root().get_node("Game/Player")
	# print("from hook", starting_position.y)
	
func _physics_process(delta):
	if can_move:
		player_movement(delta)
		
	check_collision(delta)
	# print(hook.position.y," : ", starting_position.y)
	
	if position.y <= starting_position.y:
		play_animation("idle")
	
	if returning:
		#var direction = (starting_position - position).normalized()
		#position += direction * 0.001
		reelUp()
			
func reelUp():
	# Reel fish back up, disable controls and hitbox temporarily
	velocity.y = -speed
	$hookBox.disabled = true
	if position.y <= starting_position.y-800:
		$hookBox.disabled = false 
		returning = false
		visible = false
		player.isIdle = false
		await player.play_animation("cast")
		visible = true
		position.y = starting_position.y - 800
		can_move = true
		  # Stop moving when close to target

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
		
func play_animation(animation_name):
	hook_animation.stop()
	hook_animation.play(animation_name)
	#await get_tree().create_timer(1.0).timeout
	
func check_collision(delta):	
	var collision_info = move_and_collide(velocity * delta, false, 0.08, true)
	var success = false
	var temp =  ""
	var currentScore
	
	if collision_info:
		var currentCaught = collision_info.get_collider()
		if currentCaught.get("isFish") == true:
			
			currentScore = currentCaught.getPointValue()
			# Stuff that happens once fish hits hook AKA start combo game here
			temp = currentCaught.getAnimationValue()
			currentCaught.caught()

		
			# we need to find out if the this ddr was succesful or not. Ask dunstan.
			can_move = false
			isComboRight = await $Camera2D/ComboWindow.startCombo(currentCaught.getRandomCombo(), currentCaught)
			print(isComboRight)
			if isComboRight:
				$Camera2D/UiForTimeAndScore.game_event(currentScore)
				play_animation(temp)
				print(temp)
			returning = true
			
		#if the hook gets hit by bad things.
		elif collision_info.get_collider().get("isBoot") == true:

			currentScore = currentCaught.getPointValue()
			# Stuff that happens once fish hits hook AKA start combo game here
			temp = currentCaught.getAnimationValue()
			
			currentCaught.caught()

		
			can_move = false
			#isComboRight = await $Camera2D/ComboWindow.startCombo(currentCaught.getRandomCombo())
			#print(isComboRight)
			#if isComboRight:
				#$Camera2D/UiForTimeAndScore.game_event(currentScore)
			play_animation(temp)
			print(temp)
			returning = true
			
		#if the hook gets hit by even worse things AKA shark
		elif collision_info.get_collider().get("isShark") == true:
			# Stuff that happens once fish hits hook AKA start combo game here
			print("Shark hit hook")
			temp = currentCaught.getAnimationValue()
			#collision_info.get_collider().queue_free()
			# we need to find out if the this ddr was succesfull or not. Ask dunstan.
			#can_move = false
			#await $Camera2D/ComboWindow.startCombo(["up", "down", "left", "right", "up", "down", "left", "right"])
			#can_move = true
			can_move = false
			play_animation(temp)
			returning = true
			$Camera2D/getSharked/CanvasLayer/GotSharkedStupid.set_visible(true)
			await get_tree().create_timer(1.0).timeout
			$Camera2D/getSharked/CanvasLayer/GotSharkedStupid.set_visible(false)
			
		
		#now here's the squid code
		elif collision_info.get_collider().get("isSquid") == true:
			$Camera2D/Inkblot.sprayInk()
			currentCaught.caught()
