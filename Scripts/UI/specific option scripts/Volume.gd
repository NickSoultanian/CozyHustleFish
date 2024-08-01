extends HSlider

@export
var bus_name: String
var bus_index: int

var music
var minn
var maxx

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bus_name = "Master"
	bus_index = AudioServer.get_bus_index(bus_name)
	
	value_changed.connect(_on_value_changed)
	
	minn = 0.01
	maxx = 1
	step = .001
	scrollable = true
	editable = true
	
	value = db_to_linear(
		AudioServer.get_bus_volume_db(bus_index)
	)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	# print(AudioServer.get_bus_volume_db(bus_index))
	#print(bus_index)
	#print(bus_name)
	pass
	
func _on_value_changed(valuee) -> void:
	Music.play_buttonclick()
	AudioServer.set_bus_volume_db(
			bus_index,
			linear_to_db(valuee)
	)

