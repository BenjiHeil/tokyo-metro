extends Control

var gameOverMenu = preload("res://scenes/game_over_menu.tscn")
var songCompleteMenu = preload("res://scenes/song_complete_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	find_parent("SubwayScene").game_over.connect(on_parent_game_over)
	find_parent("SubwayScene").song_complete.connect(_on_parent_song_complete)


func on_parent_game_over(score):
	launch_menu(gameOverMenu, score)

func _on_parent_song_complete(score):
	var tween = get_tree().create_tween()
	tween.tween_callback(launch_menu.bind(songCompleteMenu, score)).set_delay(3.0)

func launch_menu(manuScene, score):
	var menu = manuScene.instantiate()
	menu.find_child("Score").text = "score:" + str(score)
	add_child(menu)
