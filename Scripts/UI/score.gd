extends Control

var score = 0
# var money = 0

var scorelabel

func _process(_delta):
	$CanvasLayer/score.text = str(int(score))
func _ready():
	pass
	#var scorelabel = get_node("CanvasLayer/score")
func increase_score(amount):
	score += amount
	SceneGlobal.score = score

func updateScoreText():
	$CanvasLayer/score.text = str(int(score))
# func increase_money(amount):
	# money += amount
	
func get_score():
	return score

func game_event(amount):
	increase_score(amount)
	# increase_money(amount)
	
func isTimerStopped():
	return $CanvasLayer/timer.isTimerStopped()
