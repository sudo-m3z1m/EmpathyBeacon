extends RigidBody3D

class_name MitosisSpawn

@export var enemy_paths: Array[String]

@export var rand_force_begin: float
@export var rand_force_end: float

@export_range(0, 5, 0.1) var spawn_time: float

@onready var spawn_timer: Timer = $SpawnTimer

func prepare_spawn() -> void:
	var direction: Vector3 = Vector3.FORWARD
	var push_strength: float = randf_range(rand_force_begin, rand_force_end)
	
	spawn_timer.timeout.connect(start_mitosis)
	direction = direction.rotated(Vector3.UP, randf_range(0, 2 * PI))
	
	apply_central_force(direction * push_strength)
	spawn_timer.start(randf_range(1, 3))

func start_mitosis() -> void:
	spawn_timer.timeout.disconnect(start_mitosis)
	spawn_timer.timeout.connect(spawn_timeout)
	spawn_timer.start(spawn_time)

func spawn_timeout() -> void:
	spawn_enemy()
	die()

func spawn_enemy() -> void:
	var new_enemy: Enemy = load(enemy_paths[randi() % enemy_paths.size()]).instantiate()
	
	get_tree().current_scene.add_child(new_enemy)
	new_enemy.global_position = global_position

func die() -> void: queue_free()
