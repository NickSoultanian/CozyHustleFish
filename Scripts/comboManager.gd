extends Node2D

const TIME_LIMIT = 3.0

var Clock
var arrowInputBool = false
var timerEnded = false
var currArrowEvent
var currArrowArray
var timer
var inputAllowed = false;
var arrowDisplay
var opacityLayer
var winBool = false
signal gameEnd

# Called when the node enters the scene tree for the first time.
func _ready():
	Clock = $CanvasLayer/CanvasModulate/Panel/ColorRect/Clock
	timer = $CanvasLayer/CanvasModulate/Panel/ColorRect/Timer
	arrowDisplay = $CanvasLayer/CanvasModulate/Panel/ColorRect/ArrowDisplay
	opacityLayer = $CanvasLayer/CanvasModulate/Panel/ColorRect
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the  previous frame.
func _process(delta): 
	pass
	
func startCombo(inputArray):
	timerEnded = false
	print("started")
	showOpacityLayer()
	arrowDisplay.spawnArrows(inputArray)
	currArrowArray = inputArray
	inputAllowed = true
	Clock.startClock(TIME_LIMIT)
	timer.start(TIME_LIMIT)
	waitForTimer()
	await endGameWait()
	await endCombo(winBool) # lost
	
func endGameWait():
	return await gameEnd
	
func waitForTimer():
	await timer.timeout
	winBool = false
	gameEnd.emit()
	
func endCombo(winBool):
	inputAllowed = false
	if (!winBool):
		$CanvasLayer/CanvasModulate/Panel/ColorRect/ArrowDisplay/RedX.set_visible(true)
		await get_tree().create_timer(1.0).timeout
		$CanvasLayer/CanvasModulate/Panel/ColorRect/ArrowDisplay/RedX.set_visible(false)
	else:
		$CanvasLayer/CanvasModulate/Panel/ColorRect/ArrowDisplay/GreenCheck.set_visible(true)
		await get_tree().create_timer(1.0).timeout
		$CanvasLayer/CanvasModulate/Panel/ColorRect/ArrowDisplay/GreenCheck.set_visible(false)
	hideOpacityLayer()
	print ("done")
	timer.stop()
	Clock.endClock()
	arrowDisplay.destroyArrows()

func _input(event):
	if isArrowInput(event) && inputAllowed:
		currArrowEvent = event
		print("reached")
		var currArrow = currArrowArray.pop_front()
		if (currArrowEvent.is_action_pressed(currArrow)):
			correctKey()
			if (currArrowArray.is_empty()):
				winBool = true # won
				gameEnd.emit()
		else:
			wrongKey()
			winBool = false # lost
			gameEnd.emit()
		pass

func correctKey():
	arrowDisplay.changeNextArrow()
	print ("correct")
	pass
	
func wrongKey():
	print ("wrong")
	pass

## Helpers

func isArrowInput(event):
	if (event.is_action_pressed("up") 
	|| event.is_action_pressed("down") 
	|| event.is_action_pressed("left") 
	|| event.is_action_pressed("right")):
		return true
	return false

func showOpacityLayer():
	opacityLayer.material.set("shader_parameter/blur_amount", 2.155)

func hideOpacityLayer():
	opacityLayer.material.set("shader_parameter/blur_amount", 0)
