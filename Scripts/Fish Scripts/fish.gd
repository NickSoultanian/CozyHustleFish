#BASE CLASS FOR FISH, SHOULD NOT BE ATTACHED TO ANY NODE

extends CharacterBody2D

var velo
var possibleCombos
var rng = RandomNumberGenerator.new()
var pointValue

func _physics_process(delta):
	movement(delta)

func movement(delta):
	var collision_info = move_and_collide(velo * delta)
	if collision_info:
		velo = -velo
		$Fish.flip_h = !$Fish.flip_h
		
func caught():
	queue_free()
		
func getRandomCombo():
	return possibleCombos[rng.randi_range(0, 3)]

func getPointValue():
	return pointValue

#constructor
func _init():
	print("Constructed base fish with no override")
	velo = Vector2(-100,0)
