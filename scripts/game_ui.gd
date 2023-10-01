extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	find_parent("SubwayScene").game_over.connect(on_parent_game_over)


func on_parent_game_over(score):
	var gameOverMenu = load("res://scenes/game_over_menu.tscn").instantiate()
	gameOverMenu.find_child("Score").text = "scrore:" + str(score)
	add_child(gameOverMenu)
