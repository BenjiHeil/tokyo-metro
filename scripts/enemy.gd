extends RigidBody2D

@export var movementSpeed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	set_axis_velocity(Vector2.LEFT * movementSpeed)

