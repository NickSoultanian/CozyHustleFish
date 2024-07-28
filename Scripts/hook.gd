extends CharacterBody2D

# adjust player spped 

const speed = 5000
const reelbackspeed = 15000
const isHook = true 

@onready var hook_animation = $AnimatedSprite2D

var starting_position = Vector2()

func _ready():
	starting_position = position
	print("from hook", starting_position.y)

func _physics_process(delta):
	player_movement(delta)
	hook_animation.play("idle")
	
func player_movement(_delta): 
	if Input.is_action_pressed("ui_down"):
		velocity.x = 0 
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		velocity.x = 0 
		velocity.y = -speed
	else: 
		velocity.x = 0 
		velocity.y = 0 
		
	move_and_slide()
