extends Area2D
# Called when the node enters the scene tree for the first time.

var starting_position = Vector2()
var speed = 100
var returning = false

func _ready():
	# Connect the area_entered signal to the _on_Hook_area_entered function
	starting_position = Vector2(0, -625)
	connect("area_entered", Callable(self, "_on_Hook_area_entered"))
	
# This function is called when another area enters the hook's area.
func _on_Hook_area_entered(area):
	# Check if the area that entered is a boot.
	if area.name == "boot":
		print("Boot detected")
		returning = true
		
func _physics_process(delta):
	# This grabs the parent node
	var hook = get_parent()
	# print(hook.position.y," : ", starting_position.y)
	while returning:
		var direction = (starting_position - hook.position).normalized()
		hook.position += direction * speed * delta
		
		if hook.position.y <= starting_position.y:
			hook.position.y = starting_position.y
			returning = false  # Stop moving when close to target
			print("Reached target position")
