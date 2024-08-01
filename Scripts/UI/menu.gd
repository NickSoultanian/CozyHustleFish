extends Control

var game_scene

func _ready():
	$CanvasLayer/Control/StartButton.grab_focus()
	game_scene = preload("res://Scenes/game.tscn")

func _on_start_button_pressed():
	Music.play_buttonclick()
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_options_button_pressed():
	Music.play_buttonclick()
	get_tree().change_scene_to_file("res://Scenes/UI/options.tscn")

func _on_quit_button_pressed():
	Music.play_buttonclick()
	get_tree().quit()

func _on_hidden():
	pass 
