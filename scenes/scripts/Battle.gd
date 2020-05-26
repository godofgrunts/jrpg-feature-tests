extends Node2D

onready var tween = $Tween

func _ready():
	BattleSignals.connect("attacked", self, "_on_attacked_signal")
	
func _on_attacked_signal(i,j):
	var k = find_node(i)
	var l = find_node(j)
	jump_attack(k,l)
	pass

func jump_attack(i,j):
	var start_pos = i.position
	var end_pos = j.position
	var mid_pos = abs(start_pos.x - end_pos.x)
	
	var attacker = find_node(i.name)
	var victim = find_node(j.name)
	
	tween.interpolate_property(attacker, "position", start_pos, end_pos, .25, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween, "tween_all_completed")
	
	tween.interpolate_property(attacker, "position", end_pos, start_pos, .25, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	tween.start()
