extends Marker2D

var spawn_scene


var rng = RandomNumberGenerator.new()

var MIN_SPAWN_TIME = 8.0
var MAX_SPAWN_TIME = 3.0
var passedTime = 0;
var currSpawnTime

@export var possibleSpawns: Array[PackedScene]
@export var isLeftSide: bool

func _process(delta):

	if (passedTime > currSpawnTime):
		spawn_scene = rng.randi_range(0, 2)
		spawn(spawn_scene)
		passedTime = 0
		currSpawnTime = rng.randf_range(MIN_SPAWN_TIME, MAX_SPAWN_TIME)
		
	passedTime += delta
	pass

func spawn(spawn_scene) -> void:
	var spawn := spawn_scene.instantiate() as Node2D

	add_child(spawn)

	spawn.set_as_top_level(true)
	
	if(isLeftSide):
		spawn_scene.changeDirection()

	spawn.global_position = global_position
