extends Label

var game_time = 0
var temp_var = 0
var fakeseconds = 0
var fakeminutes = 0
var seconds = 0
func _process(delta):
	game_time += (delta)
	var minutes = int(game_time) / 60
	temp_var = seconds
	seconds = int(game_time) % 60
	if temp_var < seconds:
		fakeseconds += 15
	if fakeseconds > 59:
		fakeseconds = 0
		fakeminutes += 1
	text = "%02d:%02d" % [fakeminutes, fakeseconds]
