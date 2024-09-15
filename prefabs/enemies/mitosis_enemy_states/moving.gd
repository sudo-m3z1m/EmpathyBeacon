extends State

@export_range(0, 35, 0.01) var max_speed: float
@export_range(0, 1, 0.001) var acceleration_weight: float

var direction: Vector3

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	direction = (target.get_path_point_to_target() - target.global_position).normalized()
	target.velocity = lerp(target.velocity, direction * max_speed, acceleration_weight)

	target.move_and_slide()

func exit_state(next_state: String) -> bool:
	return is_state_valid(next_state)
