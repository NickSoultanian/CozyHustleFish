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

var arrowSounds = [
	sound1, sound2, sound3, sound4, sound5, sound6, sound7, sound8
]

var sound1 = preload("res://Music/audio/SFX/arrow success/arrowsucc1.mp3")
var sound2 = preload("res://Music/audio/SFX/arrow success/arrowsucc2.mp3")
var sound3 = preload("res://Music/audio/SFX/arrow success/arrowsucc3.mp3")
var sound4 = preload("res://Music/audio/SFX/arrow success/arrowsucc4.mp3")
var sound5 = preload("res://Music/audio/SFX/arrow success/arrowsucc5.mp3")
var sound6 = preload("res://Music/audio/SFX/arrow success/arrowsucc6.mp3")
var sound7 = preload("res://Music/audio/SFX/arrow success/arrowsucc7.mp3")
var sound8 = preload("res://Music/audio/SFX/arrow success/arrowsucc8.mp3")
								

var caughtScreen

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
	
func startCombo(inputArray, caught):
	get_tree().paused = true
	timerEnded = false
	Clock.set_visible(true)
	showOpacityLayer()
	arrowDisplay.spawnArrows(inputArray)
	currArrowArray = inputArray
	arrowSounds = [sound1, sound2, sound3, sound4, sound5, sound6, sound7, sound8]
	caughtScreen = caught.winScreen
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
	Clock.endClock()
	Clock.set_visible(false)
	if (!winBool):
		Music.play_wrongcombo()
		$CanvasLayer/ColorRect/ArrowDisplay/RedX.set_visible(true)
		await get_tree().create_timer(1.0).timeout
		$CanvasLayer/ColorRect/ArrowDisplay/RedX.set_visible(false)
	else:
		#$CanvasLayer/ColorRect/ArrowDisplay/GreenCheck.set_visible(true)
		#$CanvasLayer/ColorRect/ArrowDisplay/GreenCheck.set_visible(false)
		#match caughtFish:
			#1:
				#await printCatchScreen($CanvasLayer/ColorRect/ArrowDisplay/FishOneWinscreen)
			#2:
				#await printCatchScreen($CanvasLayer/ColorRect/ArrowDisplay/FishTwoWinscreen)
			#3:
				#await printCatchScreen($CanvasLayer/ColorRect/ArrowDisplay/FishThreeWinscreen)
			#4:
				#await printCatchScreen($CanvasLayer/ColorRect/ArrowDisplay/FishFourWinscreen)
		Music.play_combosuccess()
		$CanvasLayer/ColorRect/ArrowDisplay/CanvasLayer2/TextureRect.set_texture(caughtScreen)
		#$CanvasLayer/ColorRect/ArrowDisplay/CanvasLayer/Control/FishWinscreen.scale = Vector2(get_viewport().size.x/1150.0, get_viewport().size.y/652.0)
		$CanvasLayer/ColorRect/ArrowDisplay/CanvasLayer2/TextureRect.set_visible(true)
		await get_tree().create_timer(1.5).timeout
		$CanvasLayer/ColorRect/ArrowDisplay/CanvasLayer2/TextureRect.set_visible(false)
	hideOpacityLayer()
	timer.stop()
	arrowDisplay.destroyArrows()
	get_tree().paused = false
	
func printCatchScreen(winScreen):
	winScreen.set_visible(true)
	await get_tree().create_timer(1.5).timeout
	winScreen.set_visible(false)
	

func _input(event):
	if isArrowInput(event) && inputAllowed:
		currArrowEvent = event
		var currArrow = currArrowArray.pop_front()
		var arrowSound = arrowSounds.pop_front()
		if (currArrowEvent.is_action_pressed(currArrow)):
			#correct key was pressed
			arrowDisplay.changeNextArrow()
			Music.playArrowSound(arrowSound)
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
