extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	play("Idle")
	animation_looped.connect(_on_animation_finished)

func _input(event):
	if event.is_action_pressed("punch"):
		frame = 0
		play("Punch")
	if event.is_action_pressed("kick"):
		frame = 0
		play("Kick")
		

func _on_animation_finished():
	play("Idle")
