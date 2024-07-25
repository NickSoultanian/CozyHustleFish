extends TextureProgressBar

var timerRunning = false
var totalTime = 0.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (timerRunning == true):
		value += delta * 100/totalTime
	pass

func startClock(time):
	timerRunning = true
	totalTime = time
	
func endClock():
	timerRunning = false;
	totalTime = 0;
	value = 0;
