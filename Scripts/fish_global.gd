extends Node
# This is a global class that we can make signals on for when certain fish are caught.
# It helps classes that don't talk to eachother get information out of one another.
signal fish_caught
signal boot_caught

func emit_fish_caught():
	emit_signal("fish_caught")
	
func emit_boot_caught():
	emit_signal("boot_caught")	
	
func connect_fish_caught(target, method):
	connect("fish_caught", target, method)
	
func connect_boot_caught(target, method):
	connect("boot_caught", target, method)
