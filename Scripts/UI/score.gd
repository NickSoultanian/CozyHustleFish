extends Control

var score = 0
# var money = 0

var scorelabel

func _process(delta):
	$CanvasLayer/score.text = str(int(score))
	
func _ready():
	pass
	#var scorelabel = get_node("CanvasLayer/score")
func increase_score(amount):
	score += amount

# func increase_money(amount):
	# money += amount

func game_event(amount):
	increase_score(amount)
	# increase_money(amount)
	
func isTimerStopped():
	return $CanvasLayer/timer.isTimerStopped()
