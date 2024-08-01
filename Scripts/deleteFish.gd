extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	check_collision(_delta)
	pass

func check_collision(_delta):
	var collision_info = move_and_collide(Vector2(0,0), false, 0.08, true)
	if collision_info:
		collision_info.get_collider().destroy()
