extends "res://Scripts/Fish Scripts/fish.gd"

const isShark = true

#constructor
func _init():
	velo = Vector2(-700,0)
	winScreen = preload("res://Art Assets/Finished Art/catch popups/GotSharkedStupid.png")
	pointValue = -200
	animation = "shark"
