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
var arrowsounds: Dictionary = {"1": Callable(Music, "play_arrowsucc1()"),
								"2": Callable(Music, "play_arrowsucc2()"),
								"3": Callable(Music, "play_arrowsucc3()"),
								"4": Callable(Music, "play_arrowsucc4()"),
								"5": Callable(Music, "play_arrowsucc5()"),
								"6": Callable(Music, "play_arrowsucc6()"),
								"7": Callable(Music, "play_arrowsucc7()"),
								"8": Callable(Music, "play_arrowsucc8()")}
								
signal gameEnd

# Called when the node enters the scene tree for the first time.
func _ready():
	Clock = $CanvasLayer/ColorRect/Clock
	Clock.set_visible(false)
	timer = $CanvasLayer/ColorRect/Timer
	arrowDisplay = $CanvasLayer/ColorRect/ArrowDisplay
	opacityLayer = $CanvasLayer/ColorRect
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the  previous frame.
func _process(delta): 
	pass
	
func startCombo(inputArray):
	get_tree().paused = true
	timerEnded = false
	Clock.set_visible(true)
	showOpacityLayer()
	arrowDisplay.spawnArrows(inputArray)
	currArrowArray = inputArray
	inputAllowed = true
	Clock.startClock(TIME_LIMIT)
	timer.start(TIME_LIMIT)
	waitForTimer()
	await endGameWait()
	var tempTrack = winBool
	await endCombo(tempTrack) # lost
	return tempTrack
	
func endGameWait():
	return await gameEnd
	
func waitForTimer():
	await timer.timeout
	winBool = false
	gameEnd.emit()
	
func endCombo(winBool):
	inputAllowed = false
	if (!winBool):
		$CanvasLayer/ColorRect/ArrowDisplay/RedX.set_visible(true)
		await get_tree().create_timer(1.0).timeout
		$CanvasLayer/ColorRect/ArrowDisplay/RedX.set_visible(false)
	else:
		$CanvasLayer/ColorRect/ArrowDisplay/GreenCheck.set_visible(true)
		await get_tree().create_timer(1.0).timeout
		$CanvasLayer/ColorRect/ArrowDisplay/GreenCheck.set_visible(false)
	hideOpacityLayer()
	timer.stop()
	Clock.endClock()
	Clock.set_visible(false)
	arrowDisplay.destroyArrows()
	get_tree().paused = false
	

func _input(event):
	#var i = 0
	if isArrowInput(event) && inputAllowed:
		#i += 1
		#arrowsounds[str(i)].call()
		currArrowEvent = event
		var currArrow = currArrowArray.pop_front()
		if (currArrowEvent.is_action_pressed(currArrow)):
			#correct key was pressed
			arrowDisplay.changeNextArrow()
			if (currArrowArray.is_empty()):
				winBool = true # won
				gameEnd.emit()
		else:
			#incorrect key was pressed
			winBool = false
			gameEnd.emit()
	
	#if i >= 8:
		#i = 0
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
