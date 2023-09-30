extends Node

@export var steezAmount = 50.0 #from zero to 100
@export var hitPenalty = 5
@export var beatsPerMinute = 160
var _timer = Timer.new()

signal steez_updated(newValue)
signal begin_spawning()
signal beat()

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.player_hit.connect(_on_player_player_hit)
	begin_spawning.emit()
	add_child(_timer)
	_timer.set_wait_time(60.0 / beatsPerMinute)
	_timer.set_one_shot(false)
	_timer.start()
	_timer.timeout.connect(_on_timer_timeout)
	update_steez(steezAmount)

func _on_timer_timeout():
	beat.emit()

func _on_player_player_hit(body):
	var newValue = steezAmount - hitPenalty
	update_steez(newValue)
	
func update_steez(newValue):
	if newValue < 0:
		newValue = 0
	if newValue > 100:
		newValue = 100
	steezAmount = newValue
	steez_updated.emit(newValue)

