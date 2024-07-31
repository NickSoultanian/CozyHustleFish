extends Node2D
@onready var pausemenu = $Hook/Camera2D/Pausemenu/CanvasLayer
@export var scoreNeeded: int
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pausemenu.hide()
	Music.play_gamemusic()
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()
		print("Esc key is pressed")
		pass
	if $Hook/Camera2D/UiForTimeAndScore.isTimerStopped():
		print("endgame")
		get_tree().change_scene_to_file("res://Scenes/endGame.tscn")
	if scoreNeeded <= $Hook/Camera2D/UiForTimeAndScore.get_score():
		print("score reached")
		
func _input(event):
	if event.is_action_pressed("comboStart"):
		set_process_input(false)
		await $Hook/Camera2D/ComboWindow.startCombo(["up", "down", "left", "right", "up", "down", "left", "right"])
		set_process_input(true)
		
func pause():
	get_tree().paused = true

func resume():
	get_tree().paused = false

func pause_menu():
	if paused:
		pausemenu.hide()
		Engine.time_scale = 1
	else:
		pausemenu.show()
		Engine.time_scale = 0
	
	paused = !paused
