extends State

@export_range(0, 2, 0.001) var dash_time: float
@export_range(0, 50, 0.1) var max_dash_speed: float
@export_range(0, 1, 0.01) var dash_acceleration_weight: float

var direction: Vector3

func enter_state() -> void:
	target.attack_timer.timeout.connect(dash_ended)
	target.attack_timer.start(dash_time)

	direction = (target.last_target_position - target.global_position).normalized()

func update_state(delta: float) -> void:
	target.velocity = lerp(target.velocity, direction * max_dash_speed, dash_acceleration_weight)
	
	target.move_and_slide()

func exit_state(next_state: String) -> bool:
	if is_state_valid(next_state):
		target.attack_timer.timeout.disconnect(dash_ended)
		return true
	return false

func dash_ended() -> void:
	state_machine.change_state("Idle")
