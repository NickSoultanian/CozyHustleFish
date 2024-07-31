extends Control


func _ready():
	$CanvasLayer/Control/back.grab_focus()

func _on_hidden():
	pass # Replace with function body.

func _on_back_pressed():
	Music.play_buttonclick()
	get_tree().change_scene_to_file(SceneGlobal.previous_scene)
