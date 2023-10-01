extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_parent()
	player.player_hit.connect(_on_player_player_hit)


func _on_player_player_hit(_body):
	play()
	pass
