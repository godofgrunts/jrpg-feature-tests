extends Node2D

onready var tween = $Tween
#onready var player1 = $Player1
onready var battle_menu = preload("res://scenes/UI/BattleMenu.tscn").instance()
var menu
var attack_button
var magic_button
var item_button
var menu_button 

func _ready():
	assert(BattleSignals.connect("attacked", self, "_on_attacked_signal") == 0)
	position_menu($Player1)
	
func position_menu(character):
	character.add_child(battle_menu)
	
	var character_sprite
	var character_sprite_pos
	var character_sprite_info
	var character_sprite_size
	for child in character.get_children():
		if child.name == "BattleMenu":
			menu = child
		if child.name == "Sprite":
			character_sprite = child
			character_sprite_pos = character_sprite.global_position
			character_sprite_info = character_sprite.get_rect()
			character_sprite_size = character_sprite_info.size
	attack_button = menu.get_node("AttackButton")
	magic_button = menu.get_node("MagicButton")
	item_button = menu.get_node("ItemButton")
	menu_button = menu.get_node("MenuButton")
	
	attack_button.global_position = Vector2((character_sprite_pos.x),
			(character_sprite_pos.y + character_sprite_size.y))
	magic_button.global_position = Vector2((character_sprite_pos.x + character_sprite_size.x),
			(character_sprite_pos.y))
	item_button.global_position = Vector2((character_sprite_pos.x - character_sprite_size.x),
			(character_sprite_pos.y))
	menu_button.global_position = Vector2((character_sprite_pos.x),
			(character_sprite_pos.y - character_sprite_size.y))
	
	
func _on_attacked_signal(i,j):
	var k = find_node(i)
	var l = find_node(j)
	jump_attack(k,l)


func jump_attack(i,j):
	var start_pos = i.position
	var end_pos = j.position
	var mid_pos = abs(start_pos.x - end_pos.x)
	
	var attacker = find_node(i.name)
	var victim = find_node(j.name)
	
	attack_button.hide()
	item_button.hide()
	menu_button.hide()
	magic_button.hide()
	
	tween.interpolate_property(attacker, "position", start_pos, end_pos, .25, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween, "tween_all_completed")
	
	tween.interpolate_property(attacker, "position", end_pos, start_pos, .25, 
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	
	tween.start()
	yield(tween, "tween_all_completed")
	
	attack_button.show()
	item_button.show()
	menu_button.show()
	magic_button.show()
	
	set_process_input(true)
