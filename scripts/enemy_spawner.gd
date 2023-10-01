extends Node

const snake = preload("res://scenes/snake.tscn")
const bat = preload("res://scenes/bat.tscn")

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var parent = find_parent("SubwayScene")
	parent.beat.connect(_on_parent_beat)

func spawn_enemy(scene, node):
	var enemy = scene.instantiate()
	enemy.transform = node.transform
	add_child(enemy)

func _on_parent_beat(beat):
	match (beat):
		0:
			pass
		1:
			spawn_enemy(snake, $SnakeSpawn)
		2: 
			spawn_enemy(bat, $BatSpawn)
