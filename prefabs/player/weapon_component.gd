extends Node3D

class_name WeaponComponent

@export var projectile_packed: PackedScene

@onready var target: Player = get_parent()
@onready var camera: Camera3D = get_parent().get_parent().get_node("Camera")
@onready var weapon: Node3D = $Weapon
@onready var shot_position: Marker3D = $Weapon/ShotPosition
@onready var current_scene: Node3D = get_tree().current_scene

var projectile: Projectile

func _process(delta: float) -> void:
	var target_position: Vector3 = get_target_position()
	weapon.rotation.y = atan2(target_position.x, target_position.z)

func get_target_position() -> Vector3:
	var project_position: Vector3 = camera.project_position(get_viewport().get_mouse_position(), 20.0)

	return project_position - global_position

func shoot() -> void:
	var new_direction: Vector3 = Vector3.FORWARD
	
	projectile = projectile_packed.instantiate()
	
	new_direction = new_direction.rotated(Vector3.UP, weapon.rotation.y)
	
	current_scene.add_child(projectile)
	projectile.global_position = shot_position.global_position
	projectile.set_direction(new_direction)
