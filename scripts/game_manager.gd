extends Node

@export var steezAmount = 50.0 #from zero to 100
@export var hitPenalty = 5
@export var killBonus = 1
var beatsPerMinute
var _timer = Timer.new()
var beatCounter = 0
var beats = []
var currentStreak = 0
var highestStreak = 0
var score = 0

signal steez_updated(newValue)
signal streak_updated(newValue)
signal game_over(score)
signal beat(num)

#song patterns
#TODO: figure out a better approach for editing and storing these (maybe in-game)
var song1 = {
	"bpm": 400, #seems high but chart your patterns at quarter-time feel (so this feels like 100 bpm), allows for 16th notes
	"patterns": {
		#     1  e and a  2  e and a  3  e and a  4  e and a
		"A": [1, 0, 0, 0, 2, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 0],
		"B": [0, 0, 0, 0, 2, 0, 0, 0, 1, 1, 1, 0, 2, 0, 0, 1]
	},
	"patternOrder": ["A", "A", "A", "A"]
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player.player_hit.connect(_on_player_player_hit)
	$KillZoneBats.kill.connect(_on_kill_zone_kill)
	$KillZoneSnakes.kill.connect(_on_kill_zone_kill)
	update_steez(steezAmount)
	add_child(_timer)
	_timer.timeout.connect(_on_timer_timeout)
	load_song(song1)
	get_tree().paused = false

func _on_timer_timeout():
	beat.emit(get_next_beat())
	beatCounter += 1

func _on_player_player_hit(_body):
	var newValue = steezAmount - hitPenalty
	update_steez(newValue)
	update_streak(0)
	
func _on_kill_zone_kill(_body):
	var newValue = steezAmount + killBonus
	update_steez(newValue)
	update_streak(currentStreak + 1)
	score += 1
	
func update_steez(newValue):
	if newValue < 0:
		newValue = 0
	if newValue > 100:
		newValue = 100
	steezAmount = newValue
	if(steezAmount == 0):
		end_game()
	steez_updated.emit(newValue)
	
func update_streak(newValue):
	if newValue > highestStreak:
		highestStreak = newValue
	currentStreak = newValue
	streak_updated.emit(newValue)
	
func get_next_beat():
	if beatCounter < beats.size():
		return beats[beatCounter]
	else:
		_timer.stop()
		return -1
	
func load_song(song):
	_timer.set_wait_time(60.0 / song["bpm"])
	_timer.set_one_shot(false)
	_timer.start()
	for pattern in song["patternOrder"]:
		beats.append_array(song["patterns"][pattern])

func end_game():
	game_over.emit(score * 10 * highestStreak) # make the player feel better
	get_tree().paused = true

