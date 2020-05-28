extends Position2D

onready var tween = $Tween
var parent

func _ready():
	if get_parent():
		parent = get_parent()
	
	
func _input(event):
	var x = 0
	var character = "Player1"
	var victim = "BadGuy"
	
	if Input.is_action_just_pressed("battle_attack"):
		BattleSignals.emit_signal("attacked", character, victim)
	if Input.is_action_just_pressed("battle_item"):
		BattleSignals.emit_signal("attacked", character, victim)
	if Input.is_action_just_pressed("battle_magic"):
		BattleSignals.emit_signal("attacked", character, victim)
	if Input.is_action_just_pressed("battle_menu"):
		BattleSignals.emit_signal("attacked", character, victim)
