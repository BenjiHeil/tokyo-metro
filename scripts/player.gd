extends Area2D

signal player_hit(body)

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(on_hit)

func on_hit(body):
	player_hit.emit(body)
	body.queue_free()

