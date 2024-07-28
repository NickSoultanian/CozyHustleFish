extends Label

var game_time = 0

func _process(delta):
	game_time += delta
	var minutes = int(game_time) / 60
	var seconds = int(game_time) % 60
	text = "%02d:%02d" % [minutes, seconds]
