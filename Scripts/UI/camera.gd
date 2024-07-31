extends Camera2D

var speed  # The speed at which the camera moves
var direction = Vector2(0, 1)  # The direction in which the camera moves
var timer
var hook
var player
var timeCheck = true
func _ready():
	speed = 0
	hook = get_parent()
	player = get_tree().get_root().get_node("Game/Player")
	hook.visibility_layer = 0
	hook.can_move = false
	timer = Timer.new()
	timer.wait_time = 4  # The time after which the camera stops moving
	timer.one_shot = true
	timer.timeout.connect(self._on_Timer_timeout)
	add_child(timer)
	timer.start()
	player.isIdle = false
	

func _process(delta):
	if !timer.is_stopped():
		position += direction * speed * delta
	else:
		look_at(hook.position + Vector2(0, 1200))
	
	if timer.time_left < 2 && timer.time_left > 0:
		speed = 850
	
	if timer.time_left < 3 && timeCheck == true:
		timeCheck = false
		await player.play_animation("cast")
		hook.visibility_layer = 1
		
	
func _on_Timer_timeout():
	speed = 0  # Stop the camera
	global_position = hook.global_position + Vector2(0, 1200)
	direction = Vector2(0,0)
	hook.can_move = true
