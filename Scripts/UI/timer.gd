extends Label


var game_time = 0
var temp_var = 0
var fakeseconds = 0
var fakeminutes = 0
var fourSeconds = 0
var minutes
var seconds
var timer

func _ready():
	timer = $Timer
	timer.start(90.0)
	print("timer started")

func _process(_delta):
	@warning_ignore("integer_division")
	
	minutes = int(timer.get_time_left()) / 60
	seconds = int(timer.get_time_left()) % 60
	
	text = "%2d:%02d" % [minutes, seconds]
	
func isTimerStopped():
	return timer.is_stopped()
	
	#game_time += (delta)
	#var minutes = int(game_time) / 60
	#temp_var = fourSeconds
	#fourSeconds = int(game_time)/4
	#if temp_var < fourSeconds:
		#fakeseconds += 15
	#if fakeseconds > 59:
		#fakeseconds = 0
		#fakeminutes += 1
	#text = "%02d:%02d" % [fakeminutes, fakeseconds]
	
	#game_time += (delta)
	#var minutes = int(game_time) / 60
	#temp_var = fourSeconds
	#fourSeconds = int(game_time)/4
	#if temp_var < fourSeconds:
		#fakeseconds += 15
	#if fakeseconds > 59:
		#fakeseconds = 0
		#fakeminutes += 1
	#text = "%02d:%02d" % [fakeminutes, fakeseconds]
