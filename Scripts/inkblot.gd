extends Control

const TIME_LIMIT = 8.0

var inkBlot
var timer
var animationPlayer

func _ready():
	inkBlot = $CanvasLayer/Control/InkOnUrEye
	inkBlot.set_visible(false)
	timer = $CanvasLayer/Timer
	animationPlayer = $CanvasLayer/AnimationPlayer

func sprayInk():
	inkBlot.set_visible(true)
	inkBlot.scale = Vector2(get_viewport().size.x * 0.00036, get_viewport().size.y * 0.00062)
	Music.play_squidinked()
	timer.start(TIME_LIMIT)
	animationPlayer.play("fade_out")
	await timer.timeout
	inkBlot.set_visible(false)
