extends AudioStreamPlayer2D

func _ready():
	get_parent().first_hit.connect(_on_parent_first_hit)

func _on_parent_first_hit():
	play()
