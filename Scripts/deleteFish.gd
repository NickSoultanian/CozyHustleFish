extends StaticBody2D

func _ready():
	pass 

func _process(_delta):
	check_collision(_delta)

func check_collision(_delta):
	var collision_info = move_and_collide(Vector2(0,0), false, 0.08, true)
	if collision_info:
		collision_info.get_collider().destroy()
