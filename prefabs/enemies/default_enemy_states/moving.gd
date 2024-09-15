extends State

@export var max_speed: float
@export var acceleration_weight: float

var target_position: Vector3

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	pass

func exit_state(next_state: String) -> bool:
	return is_state_valid(next_state)

func check_target(body: Node3D) -> void:
	if !(body == target.target):
		return
	
