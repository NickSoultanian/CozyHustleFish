extends Label

var minutes
var seconds
var timer

func _ready():
	timer = $Timer
	timer.start(90.0)
	
@warning_ignore("integer_division")
func _process(_delta):
	minutes = int(timer.get_time_left()) / 60
	seconds = int(timer.get_time_left()) % 60
	
	text = "%2d:%02d" % [minutes, seconds]
	
func isTimerStopped():
	return timer.is_stopped()
