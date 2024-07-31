extends CharacterBody2D

@onready var player_animation = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var isCasting = false
var isIdle = true
func _physics_process(delta):
	if isIdle:
		play_animation("idle")

func play_animation(animation_name):	
	if animation_name == "cast":
		player_animation.stop()
		player_animation.play("cast")
		await get_tree().create_timer(2.0).timeout
		Music.play_hookcastandsplash()
		isIdle = true
	elif animation_name == "idle":
		player_animation.play("idle")
