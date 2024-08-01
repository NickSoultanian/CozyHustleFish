extends Control

var score = 0

var scorelabel

func _process(_delta):
	$CanvasLayer/score.text = str(int(score))
	GlobalScore.SCORE = score
	
func _ready():
	pass

func increase_score(amount):
	score += amount

func updateScoreText():
	$CanvasLayer/score.text = str(int(score))
	
func get_score():
	return score

func game_event(amount):
	increase_score(amount)

func isTimerStopped():
	return $CanvasLayer/timer.isTimerStopped()
