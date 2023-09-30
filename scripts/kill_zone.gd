extends Area2D

@export var targetGroupName: String

signal kill(body)

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)
	
func _on_body_entered(body):
	if body.is_in_group(targetGroupName):
		kill.emit(body)
