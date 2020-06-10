extends Position2D

class_name Battler



export var TARGET_OFFSET_DISTANCE: float = 120.0

export var stats: Resource

var target_global_position: Vector2

var selected: bool = false setget set_selected
var selectable: bool = false setget set_selectable

func set_selected(value):
	selected = value
	

func set_selectable(value):
	selectable = value
	if not selectable:
		set_selected(false)

func take_damage(hit):
	stats.take_damage(hit)

func _on_health_depleted():
	selectable = false
	BattleSignals.emit_signal("died", self.name)
