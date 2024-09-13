extends State

@export_range(0, 1, 0.001) var acceleration_weight: float
@export var max_speed: float

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	target.velocity = lerp(target.velocity, state_machine.direction * max_speed,\
	acceleration_weight)

	target.rotation.y = lerp(target.rotation.y,\
	 atan2(state_machine.direction.x, state_machine.direction.z), 0.1) #TODO need to remake this
	
	target.move_and_slide()

func exit_state(next_state: StateMachine.States) -> bool:
	return is_state_valid(next_state)
