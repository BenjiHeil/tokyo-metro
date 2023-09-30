extends Node

const snake = preload("res://scenes/snake.tscn")
const bat = preload("res://scenes/bat.tscn")
var canSpawn = false

# Called when the node enters the scene tree for the first time.
func _ready(): 
	var parent = find_parent("SubwayScene")
	parent.begin_spawning.connect(_on_parent_begin_spawning)
	parent.beat.connect(_on_parent_beat)

func spawn_enemy(scene, node):
	var enemy = scene.instantiate()
	enemy.transform = node.transform
	add_child(enemy)
	
func _on_parent_begin_spawning():
	canSpawn = true

func _on_parent_beat():
	if canSpawn: 
		spawn_enemy(snake, $SnakeSpawn)
