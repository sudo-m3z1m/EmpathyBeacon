extends State

@export_range(0, 35, 0.01) var max_speed: float
@export_range(0, 1, 0.01) var acceleration_weight: float

var direction: Vector3

func enter_state() -> void:
	target.attack_area.body_entered.connect(check_target)

func update_state(delta: float) -> void:
	direction = (target.get_path_point_to_target() - target.global_position).normalized()
	target.velocity = lerp(target.velocity, direction * max_speed, acceleration_weight)

	target.move_and_slide()

func exit_state(next_state: String) -> bool:
	if is_state_valid(next_state):
		target.attack_area.body_entered.disconnect(check_target)
		return true
	return false

func check_target(body: Node3D) -> void:
	if !(body == target.target) or !target.cooldown_timer.is_stopped():
		return
	state_machine.change_state("Prepare")
