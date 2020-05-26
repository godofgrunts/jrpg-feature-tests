extends MarginContainer

var cursor_pos = 0
var atk_arrow
var mag_arrow
var itm_arrow

enum cursor {ATTACK, MAGIC, ITEM}

func _ready():
	atk_arrow = find_node("AttackArrow")
	mag_arrow = find_node("MagicArrow")
	itm_arrow = find_node("ItemArrow")
	atk_arrow.show()
	mag_arrow.hide()
	itm_arrow.hide()
	
func _input(event):
	if Input.is_action_just_pressed("ui_down"):
		if cursor_pos == 2:
			cursor_pos = 0
		else:
			cursor_pos += 1

	if Input.is_action_just_pressed("ui_up"):
		if cursor_pos == 0:
			cursor_pos = 2
		else:
			cursor_pos -= 1

	match cursor_pos:
		cursor.ATTACK:
			atk_arrow.show()
			mag_arrow.hide()
			itm_arrow.hide()
		cursor.MAGIC:
			atk_arrow.hide()
			mag_arrow.show()
			itm_arrow.hide()
		cursor.ITEM:
			atk_arrow.hide()
			mag_arrow.hide()
			itm_arrow.show()
			
	if Input.is_action_just_pressed("ui_accept"):
		var character = "Player1"
		var victim = "BadGuy"
		match cursor_pos:
			cursor.ATTACK:
				BattleSignals.emit_signal("attacked", character, victim)
			cursor.MAGIC:
				BattleSignals.emit_signal("attacked", character, victim)
			cursor.ITEM:
				BattleSignals.emit_signal("attacked", character, victim)
