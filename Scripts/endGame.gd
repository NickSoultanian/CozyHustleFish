extends Node2D

var finalScoreText
var score = 0

func _ready():
	Music.stop_reeling()
	finalScoreText = $CanvasLayer/TextureRect/Label
	finalScoreText.text = str(GlobalScore.SCORE)
	
func _send_score(data):
	score = data

func _process(_delta):
	pass

func _on_texture_button_pressed():
	Music.play_menumusic()
	get_tree().change_scene_to_file("res://Scenes/UI/mainmenu.tscn")
