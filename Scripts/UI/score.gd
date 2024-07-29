extends Label

var score = 0
var money = 0


func _process(delta):
	text = str(int(score))

func _ready():
	FishGlobal.connect("fish_caught", Callable(self, "game_event"))
	FishGlobal.connect("boot_caught", Callable(self, "boot_hit"))
func increase_score(amount):
	score += amount
	# print("Score: ", score)

# has not been implemented yet
func increase_money(amount):
	money += amount
	# print("Money: ", money)
func boot_hit():
	increase_score(-10)
func game_event():
	increase_score(10)
	increase_money(100)
