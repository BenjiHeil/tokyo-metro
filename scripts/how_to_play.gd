extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(_on_pressed)


func _on_pressed():
	var howToPlay = load("res://scenes/tutorial.tscn").instantiate()
	find_parent("Main").add_child(howToPlay)
