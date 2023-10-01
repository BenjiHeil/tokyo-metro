extends RigidBody2D

var movementSpeed = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	set_axis_velocity(Vector2.LEFT * movementSpeed)

