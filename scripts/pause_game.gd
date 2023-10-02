extends Node

var pauseScreen

func _ready():
	pauseScreen = find_child("PauseScreen")

func _input(event):
	var tree = get_tree()
	if event.is_action_pressed("pause"):
		tree.paused = !tree.paused
		pauseScreen.visible = tree.paused

