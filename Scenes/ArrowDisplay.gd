extends CanvasLayer

var upScene = preload("res://Art Assets/Prefab Nodes/downArrow.tscn")
var downScene = preload("res://Art Assets/Prefab Nodes/downArrow.tscn")
var leftScene = preload("res://Art Assets/Prefab Nodes/leftArrow.tscn")
var rightScene = preload("res://Art Assets/Prefab Nodes/rightArrow.tscn")

var down = load("res://Art Assets/arrows/down.png")
var downFilled = load("res://Art Assets/arrows/down_filled.png")
var left = load("res://Art Assets/arrows/left.png")
var leftFilled = load("res://Art Assets/arrows/left_filled.png")
var right = load("res://Art Assets/arrows/right.png")
var rightFilled = load("res://Art Assets/arrows/right_filled.png")
var up = load("res://Art Assets/arrows/up.png")
var upFilled = load("res://Art Assets/arrows/up_filled.png")

var arrowDisplayStack = []
var arrowList
var currArrowIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	arrowList = $ItemList
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnArrows(arrowArray):
	arrowList.max_columns = arrowArray.size()
	arrowList.size.x = arrowArray.size() * 180
	arrowList.position.x = (get_viewport().size.x - arrowList.size.x)/2
	
	for arrow in arrowArray:
		var arr_instance
		if (arrow == "up"):
			arr_instance = up
		if (arrow == "down"):
			arr_instance = down
		if (arrow == "left"):
			arr_instance = left
		if (arrow == "right"):
			arr_instance = right
		arrowList.add_icon_item(arr_instance)

func changeNextArrow():
	var arrow = arrowList.get_item_icon(currArrowIndex)
	print(arrow)
	if (arrow == up):
		arrowList.set_item_icon(currArrowIndex, upFilled)
	if (arrow == down):
		arrowList.set_item_icon(currArrowIndex, downFilled)
	if (arrow == left):
		arrowList.set_item_icon(currArrowIndex, leftFilled)
	if (arrow == right):
		arrowList.set_item_icon(currArrowIndex, rightFilled)
	currArrowIndex += 1
	
func destroyArrows():
	arrowList.clear()
	currArrowIndex = 0;
