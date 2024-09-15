extends Area3D

class_name HealthComponent

@export_range(0, 200, 0.1) var health_points: float

@onready var target: Object = get_parent()

func damage(damage: float) -> void:
	health_points -= damage
	if health_points > 0:
		return

	target.die()
