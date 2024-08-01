extends OptionButton

var Resolutions: Dictionary = {"1920x1080":Vector2i(1920,1080),
								"1366x768":Vector2i(1366,768),
								"1536x864":Vector2i(1536,864),
								"1280x720":Vector2i(1280,720),
								"1440x900":Vector2i(1440,900),
								"1600x900":Vector2i(1600,900),
								"1024x600":Vector2i(1024,600),
								"800x600":Vector2i(800,600)}

func _ready():
	add_resoloutions()	

func _process(_delta):
	pass
	
func add_resoloutions():
	for r in Resolutions:
		add_item(r)
	remove_item(0)
	
func _on_item_selected(index):
	Music.play_buttonclick()
	var id = get_item_text(index)
	get_window().set_size(Resolutions[id])
	center_window()
	
func center_window():
	var center_screen = DisplayServer.screen_get_position()+DisplayServer.screen_get_size()/2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(center_screen - window_size/2)

func _on_check_box_toggled(toggled_on):
	if toggled_on:
		Music.play_buttonclick()
		get_window().set_mode(Window.MODE_FULLSCREEN)
	else:
		Music.play_buttonclick()
		get_window().set_mode(Window.MODE_WINDOWED)
		center_window()
