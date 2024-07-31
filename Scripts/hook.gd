extends CharacterBody2D

# adjust player spped 
var speed = 0
var max_speed = 15000.0
var accel = 5.0
const reelbackspeed = 15000
const isHook = true 
var returning = false
var can_move = true
var isComboRight = false
var catching = false
var player
var scoreToAdd = 0;

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
	
	if position.y <= starting_position.y-795:
		play_animation("idle")
	
	if returning:
		#var direction = (starting_position - position).normalized()
		#position += direction * 0.001
		reelUp()
			
func reelUp():
	# Reel fish back up, disable controls and hitbox temporarily
	velocity.y = -5000
	$hookBox.disabled = true
	if position.y <= starting_position.y-800:
		$hookBox.disabled = false 
		returning = false
		visible = false
		player.isIdle = false
		Music.stop_reeling()
		await player.play_animation("cast")
		visible = true
		speed = 0
		velocity.y = 0
		position.y = starting_position.y - 800
		can_move = true
		  # Stop moving when close to target

func player_movement(delta): 
	if Input.is_action_pressed("ui_down"):
		speed = velocity.y + (max_speed - velocity.y) * (accel * delta)
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		speed = velocity.y + (-max_speed - velocity.y) * (accel * delta)
		velocity.y = speed
	else: 
		if (velocity.y != 0):
			speed = velocity.y + (0 - velocity.y) * (accel * delta)
			velocity.y = speed
		else:
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
			temp = currentCaught.getAnimationValue()
			currentCaught.caught()

			Music.play_fishcaught()
			can_move = false
			isComboRight = await $Camera2D/ComboWindow.startCombo(currentCaught.getRandomCombo(), currentCaught)
			print(isComboRight)
			if isComboRight:
				$Camera2D/UiForTimeAndScore.game_event(currentScore)
				play_animation(temp)
				print(temp)
				
			returning = true
			Music.play_reeling()
			
		#if the hook gets hit by bad things.
		elif collision_info.get_collider().get("isBoot") == true:

			currentScore = currentCaught.getPointValue()
			temp = currentCaught.getAnimationValue()
			currentCaught.caught()
			can_move = false
			play_animation(temp)
			print(temp)
			returning = true
			Music.play_reeling()
			
		elif collision_info.get_collider().get("isShark") == true:

			currentScore = currentCaught.getPointValue()
			print("Shark hit hook")
			temp = currentCaught.getAnimationValue()

			can_move = false
			play_animation(temp)
			Music.play_sharkcaughtbite()
			returning = true
			$Camera2D/UiForTimeAndScore.game_event(currentScore)
			$Camera2D/getSharked/CanvasLayer/GotSharkedStupid.set_visible(true)
			await get_tree().create_timer(1.5).timeout
			$Camera2D/getSharked/CanvasLayer/GotSharkedStupid.set_visible(false)
			
		elif collision_info.get_collider().get("isSquid") == true:
			$Camera2D/Inkblot.sprayInk()
			currentCaught.caught()
