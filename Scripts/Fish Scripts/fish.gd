#BASE CLASS FOR FISH, SHOULD NOT BE ATTACHED TO ANY NODE

extends CharacterBody2D

var velo
var possibleCombos
var rng = RandomNumberGenerator.new()
var pointValue
var animation = ""

func _physics_process(delta):
	movement(delta)

func movement(delta):
	var collision_info = move_and_collide(velo * delta)
	if collision_info:
		changeDirection()
		
func caught():
	queue_free()
		
func getRandomCombo():
	return possibleCombos[rng.randi_range(0, 3)]

func getPointValue():
	return pointValue

func changeDirection():
	velo = -velo
	$Fish.flip_h = !$Fish.flip_h
	
func getAnimationValue():
	return animation
	
#constructor
func _init():
	velo = Vector2(-100,0)
