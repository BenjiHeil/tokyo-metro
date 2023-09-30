extends ColorRect

var percentFull = 50.0
var maxSize = 256

# Called when the node enters the scene tree for the first time.
func _ready():
	find_parent("SubwayScene").steez_updated.connect(_on_parent_steez_updated)


func _on_parent_steez_updated(value):
	percentFull = value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	size = Vector2(maxSize * percentFull / 100.0, size.y)
	
