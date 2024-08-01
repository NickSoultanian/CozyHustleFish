extends Control

func _ready():
	$CanvasLayer/Control/back.grab_focus()

func _on_hidden():
	pass

func _on_back_pressed():
	Music.play_buttonclick()
	get_tree().change_scene_to_file("res://Scenes/UI/mainmenu.tscn")
