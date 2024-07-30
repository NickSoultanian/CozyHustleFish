extends TextureProgressBar

var timerRunning = false
var totalTime = 0.0

const CLOCK_TIMER_WIDTH = 1626.0
const CLOCK_TIMER_HEIGHT = 1623.0
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (timerRunning == true):
		value += delta * 100/totalTime
	pass

func startClock(time):
	scale = Vector2(get_viewport().size.x/10.0/CLOCK_TIMER_WIDTH, get_viewport().size.x/10.0/CLOCK_TIMER_WIDTH) 
	position = Vector2(get_viewport().size.x - (scale.x * size.x + (scale.x * size.x / 5.0)), 
						get_viewport().size.y - (scale.y * size.y + (scale.y * size.y / 5.0)))
	print(position) 
	timerRunning = true
	totalTime = time
	
func endClock():
	timerRunning = false;
	totalTime = 0;
	value = 0;
