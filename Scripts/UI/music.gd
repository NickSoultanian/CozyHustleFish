extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playing == false:
		play()
	pass

func play_buttonclick():
	$buttonclick.play()

func play_combosuccess():
	$combosuccess.play()

func play_fishcaught():
	$fishcaught.play()

func play_hookcastandsplash():
	$hookcastandsplash.play()
	
func play_reeling():
	$reeling.play()
	
func play_sharkcaughtbite():
	$sharkcaughtbite.play()

func play_squidinked():
	$squidinked.play()
	
func play_wrongcombo():
	$wrongcombo.play()
	
func play_gamemusic():
	set_stream(load("res://Music/audio/fishgame.wav"))

# individual arrow sounds! 
func play_arrowsucc1():
	$arrowsucc1.play()
func play_arrowsucc2():
	$arrowsucc2.play()
func play_arrowsucc3():
	$arrowsucc3.play()
func play_arrowsucc4():
	$arrowsucc4.play()
func play_arrowsucc5():
	$arrowsucc5.play()
func play_arrowsucc6():
	$arrowsucc6.play()
func play_arrowsucc7():
	$arrowsucc7.play()
func play_arrowsucc8():
	$arrowsucc8.play()			
