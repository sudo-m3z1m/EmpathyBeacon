extends Node3D

class_name Projectile

@export_range(1, 50, 0.1) var projectile_speed: float

@onready var damage_component: DamageComponent = $DamageComponent

var direction: Vector3 = Vector3.FORWARD

func _ready() -> void:
	damage_component.body_entered.connect(body_entered)

func _process(delta: float) -> void:
	move(delta)

func move(delta: float) -> void:
	global_position += direction * projectile_speed * delta

func set_direction(new_direction: Vector3 = Vector3.FORWARD) -> void:
	direction = -new_direction
	rotation.y = atan2(new_direction.x, new_direction.z)

func body_entered(body: Node3D) -> void:
	queue_free()
