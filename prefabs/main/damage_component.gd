extends Area3D

class_name DamageComponent

@export_range(1, 50, 0.1) var damage: float

func _ready() -> void:
	area_entered.connect(check_health_component)

func check_health_component(area: Node3D) -> void:
	if !(area is HealthComponent):
		return
	area.damage(damage)
	
