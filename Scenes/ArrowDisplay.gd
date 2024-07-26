extends CanvasLayer

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
	arrowList.icon_scale = min(get_viewport().size.y/3.0/561.0, get_viewport().size.x/arrowArray.size()/561.0)
	print(arrowList.icon_scale)
	arrowList.size = Vector2(arrowArray.size() * (561 * arrowList.icon_scale + 8), get_viewport().size.y/3.0)
	
	var horiListSize = 0;
	for arrow in arrowArray:
		var arr_instance
		if (arrow == "up"):
			arr_instance = up
			horiListSize += 343 * arrowList.icon_scale + 8
		if (arrow == "down"):
			arr_instance = down
			horiListSize += 343 * arrowList.icon_scale + 8
		if (arrow == "left"):
			arr_instance = left
			horiListSize += 561 * arrowList.icon_scale + 8
		if (arrow == "right"):
			arr_instance = right
			horiListSize += 561 * arrowList.icon_scale + 8
		
		arrowList.size = Vector2(horiListSize + 8, get_viewport().size.y/3.0)
		arrowList.position = Vector2((get_viewport().size.x - arrowList.size.x)/2, get_viewport().size.y * 1.0/3.0)
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
