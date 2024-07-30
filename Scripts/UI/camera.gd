extends Camera2D

var speed = 340  # The speed at which the camera moves
var direction = Vector2(0, 1)  # The direction in which the camera moves
var timer
var hook
var player
func _ready():
	hook = get_parent()
	player = get_tree().get_root().get_node("Game/Player")
	hook.visibility_layer = 0
	hook.can_move = false
	timer = Timer.new()
	timer.wait_time = 5  # The time after which the camera stops moving
	timer.one_shot = true
	timer.timeout.connect(self._on_Timer_timeout)
	add_child(timer)
	timer.start()
	

func _process(delta):
	if speed != 0:
		position += direction * speed * delta
	else:
		look_at(hook.position + Vector2(0, 900))
func _on_Timer_timeout():
	speed = 0  # Stop the camera
	position = hook.position + Vector2(0, 900)
	direction = Vector2(0,0)
	hook.visibility_layer = 1
	
	player.isIdle = false
	player.play_animation("cast")

	hook.can_move = true
