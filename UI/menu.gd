extends Control
# simple menu script logic press F6 to start menu
 
# allow control on keyboard 
func _ready():
	$VBoxContainer/StartButton.grab_focus()
	pass

# starts the game when pressed 
# replace with the game node via drag and drop 
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")


# quit button 
func _on_quit_button_pressed():
	get_tree().quit()
