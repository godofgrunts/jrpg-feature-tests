extends MarginContainer

var cursor_pos = 0
var atk_arrow
var mag_arrow
var itm_arrow

enum cursor {ATTACK, MAGIC, ITEM}

func _ready():
	atk_arrow = find_node("AttackButton")
	mag_arrow = find_node("MagicButton")
	itm_arrow = find_node("ItemButton")
	
func _input(event):
	var character = "Player1"
	var victim = "BadGuy"
	
	if Input.is_action_just_pressed("battle_attack"):
		BattleSignals.emit_signal("attacked", character, victim)
	if Input.is_action_just_pressed("battle_item"):
		BattleSignals.emit_signal("attacked", character, victim)
	if Input.is_action_just_pressed("battle_magic"):
		BattleSignals.emit_signal("attacked", character, victim)
