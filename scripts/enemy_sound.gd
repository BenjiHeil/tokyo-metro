extends AudioStreamPlayer2D

func _ready():
	get_parent().kill.connect(_on_parent_body_entered)
	
func _on_parent_body_entered(_body):
	play()
