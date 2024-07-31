extends Control
# simple menu script logic press F6 to start menu
var options
# allow control on keyboard 
func _ready():
	$CanvasLayer/Control2/option.grab_focus()
	$CanvasLayer/Control2/mainmenu.grab_focus()
	$CanvasLayer/Control2/quit.grab_focus()
	$options/Control/back.grab_focus()
	pass

func _on_hidden():
	pass # Replace with function body.

func _on_quit_pressed():
	Music.play_buttonclick()
	get_tree().quit()

func _on_option_pressed():
	# SceneGlobal.previous_scene = get_tree().current_scene.scene_file_path
	Music.play_buttonclick()
	$CanvasLayer.hide()
	$options.show()
	

func _on_mainmenu_pressed():
	Music.play_buttonclick()
	get_tree().change_scene_to_file("res://Scenes/UI/mainmenu.tscn")

func _on_back_pressed():
	$options.hide()
	$CanvasLayer.show()
	pass # Replace with function body.
