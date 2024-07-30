extends Marker2D

@export var spawn_scene: PackedScene


var passedTime = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (passedTime > 1):
		spawn()
		passedTime = 0
		
	passedTime += delta
	pass

func spawn(_spawn_scene := spawn_scene) -> void:
	var spawn := _spawn_scene.instantiate() as Node2D

	add_child(spawn)

  # Prevents the Spawner2D transform from affecting the new instance
	spawn.set_as_top_level(true)

  # Move the new instance to the Spawner2D position
	spawn.global_position = global_position
