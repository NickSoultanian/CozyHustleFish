extends Node2D

@onready var pausemenu = $Hook/Camera2D/Pausemenu/CanvasLayer
@onready var leftsidewall = $leftsideWall
@onready var rightsidewall = $rightsideWall
@onready var water = $water
@export var scoreNeeded: int

var paused = false

func _ready():
	pausemenu.hide()
	Music.play_gamemusic()
	rightsidewall.play("default")
	leftsidewall.play("default")
	water.play("default")

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pause_menu()
		pass
	if $Hook/Camera2D/UiForTimeAndScore.isTimerStopped():
		get_tree().change_scene_to_file("res://Scenes/UI/endGame.tscn")

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
