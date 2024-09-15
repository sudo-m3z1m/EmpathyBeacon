extends State

@export_range(0.1, 5, 0.1) var prepare_time: float

func enter_state() -> void:
	target.attack_timer.timeout.connect(prepare_timeout)
	target.attack_timer.start(prepare_time)
	target.last_target_position = target.get_path_point_to_target()

func update_state(delta: float) -> void:
	pass

func exit_state(next_state: String) -> bool:
	if is_state_valid(next_state):
		target.attack_timer.timeout.disconnect(prepare_timeout)
		return true
	return false

func prepare_timeout() -> void:
	state_machine.change_state("Dash")
