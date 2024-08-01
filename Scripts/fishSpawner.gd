extends CollisionShape2D

var spawn_scene

var rng = RandomNumberGenerator.new()

var MIN_SPAWN_TIME = 10.0
var MAX_SPAWN_TIME = 5.0
var passedTime = 0;
var currSpawnTime = rng.randf_range(MIN_SPAWN_TIME, MAX_SPAWN_TIME)

@export var possibleSpawns: Array[PackedScene]
@export var isLeftSide: bool

func _process(delta):
	if (passedTime > currSpawnTime):
		spawn_scene = possibleSpawns[rng.randi_range(0, 2)]
		spawn(spawn_scene, rng.randf_range(0, shape.get_rect().size.y))
		passedTime = 0
		currSpawnTime = rng.randf_range(MIN_SPAWN_TIME, MAX_SPAWN_TIME)
		
	passedTime += delta

@warning_ignore("shadowed_variable")
func spawn(spawn_scene, yPos):
	var spawn := spawn_scene.instantiate() as Node2D
	add_child(spawn)
	spawn.set_as_top_level(true)
	
	if(isLeftSide):
		spawn.changeDirection()

	spawn.global_position = Vector2(global_position.x, yPos + (global_position.y - shape.get_rect().size.y/2))
