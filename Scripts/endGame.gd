extends Node2D

var finalScoreText
# Called when the node enters the scene tree for the first time.
func _ready():
	Music.stop_reeling()
	finalScoreText = $CanvasLayer/TextureRect/Label
	finalScoreText.text = str(SceneGlobal.score)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	Music.play_menumusic()
	get_tree().change_scene_to_file("res://Scenes/UI/mainmenu.tscn")
