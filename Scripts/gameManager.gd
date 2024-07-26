extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 
	
 
func _input(event):
	if event.is_action_pressed("comboStart"):
		print("nice")
		set_process_input(false)
		await $Hook/Camera2D/ComboWindow.startCombo(["up", "down", "left", "right", "up", "down", "left", "right"])
		set_process_input(true)
