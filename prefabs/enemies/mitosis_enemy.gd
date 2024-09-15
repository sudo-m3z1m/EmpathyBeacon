extends Enemy

@export var mitosis_spawns_packed: PackedScene
@export_range(1, 10) var max_mitosis_spawns_count: int

func _ready() -> void:
	states = {
		"Idle": $StateMachine/Idle,
		"Moving": $StateMachine/Moving
	}

func _process(delta: float) -> void:
	agent.set_target_position(target.global_position)

	if !agent.is_target_reachable():
		return state_machine.change_state("Idle")
	state_machine.change_state("Moving")

func die() -> void:
	var spawns_count: int = randi_range(2, max_mitosis_spawns_count)
	for spawn_index in spawns_count:
		spawn_mitosis_spawn()

	queue_free()

func spawn_mitosis_spawn() -> void:
	var new_mitosis_spawn: MitosisSpawn = mitosis_spawns_packed.instantiate()
	
	get_tree().current_scene.add_child(new_mitosis_spawn)
	new_mitosis_spawn.global_position = Vector3(global_position.x + randf_range(-1, 1),\
	 global_position.y, global_position.z + randf_range(-1, 1))

	new_mitosis_spawn.prepare_spawn()
