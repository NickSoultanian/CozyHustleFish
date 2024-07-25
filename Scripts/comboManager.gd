extends Node2D

const TIME_LIMIT = 3.0

var Clock
var arrowInputBool = false
var timerEnded = false
var currArrowEvent
var currArrowArray
var timer
var inputAllowed = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	Clock = $CanvasLayer/CanvasModulate/Panel/ColorRect/Clock
	timer = $CanvasLayer/CanvasModulate/Panel/ColorRect/Timer
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): 
	pass
	
func startCombo(inputArray):
	timerEnded = false
	print("started")
	$CanvasLayer/CanvasModulate/Panel/ColorRect.material.set("shader_parameter/blur_amount", 2.155)
	$CanvasLayer/CanvasModulate/Panel/ColorRect/ArrowDisplay.spawnArrows(inputArray)
	currArrowArray = inputArray
	inputAllowed = true
	Clock.startClock(TIME_LIMIT)
	timer.start(TIME_LIMIT)
	await timer.timeout
	endCombo(false) # lost

func endCombo(winBool):
	$CanvasLayer/CanvasModulate/Panel/ColorRect.material.set("shader_parameter/blur_amount", 0)
	print ("done")
	timer.stop()
	Clock.endClock()

func _input(event):
	if isArrowInput(event) && inputAllowed:
		currArrowEvent = event
		print("reached")
		if (currArrowEvent.is_action_pressed(currArrowArray.pop_front())):
			correctKey()
			if (currArrowArray.empty()):
				endCombo(true) # won
		else:
			wrongKey()
			endCombo(false) # lost
		pass

func isArrowInput(event):
	if (event.is_action_pressed("up") 
	|| event.is_action_pressed("down") 
	|| event.is_action_pressed("left") 
	|| event.is_action_pressed("right")):
		return true
	return false

func correctKey():
	print ("correct")
	pass
	
func wrongKey():
	print ("wrong")
	pass
