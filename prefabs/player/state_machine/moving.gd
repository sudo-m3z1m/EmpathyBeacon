extends State

@export_range(0, 1, 0.001) var acceleration_weight: float
@export var max_speed: float

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	target.velocity = lerp(target.velocity, target.direction * max_speed,\
	acceleration_weight)

	target.move_and_slide()

func exit_state(next_state: String) -> bool:
	return is_state_valid(next_state)
