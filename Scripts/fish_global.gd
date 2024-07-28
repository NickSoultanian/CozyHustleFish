extends Node

signal fish_caught

func emit_fish_caught():
	emit_signal("fish_caught")

func connect_fish_caught(target, method):
	connect("fish_caught", target, method)
