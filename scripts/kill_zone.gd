extends Area2D

@export var targetGroupName: String
@export var actionName: String
@export var activeTime: float
var collider: CollisionShape2D
var deathDelay

signal kill(body)

# Called when the node enters the scene tree for the first time.
func _ready():
	body_entered.connect(_on_body_entered)
	collider = find_child("Kill")
	monitoring = false
	
	
func _input(event):
	if event.is_action_pressed(actionName):
		monitoring = true
		var tween = get_tree().create_tween()
		tween.tween_callback(_on_collider_timeout).set_delay(activeTime)
		
func _on_collider_timeout():
	monitoring = false
	
func _on_body_entered(body):
	if body.is_in_group(targetGroupName):
		kill.emit(body)
		var tween = get_tree().create_tween()
		tween.tween_callback(body.queue_free).set_delay(.01)
