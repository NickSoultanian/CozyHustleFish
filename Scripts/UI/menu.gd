extends Control
# simple menu script logic press F6 to start menu
 
# allow control on keyboard 
func _ready():
	$CanvasLayer/Control/VBoxContainer/StartButton.grab_focus()

# starts the game when pressed 
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/options.tscn")
	
# quit button 
func _on_quit_button_pressed():
	get_tree().quit()

func _on_hidden():
	pass # Replace with function body.
