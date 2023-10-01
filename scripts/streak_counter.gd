extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(0)
	find_parent("SubwayScene").streak_updated.connect(_on_parent_streak_updated)


func _on_parent_streak_updated(newValue):
	text = str(newValue)
