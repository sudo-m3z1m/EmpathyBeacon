extends Enemy

@onready var attack_timer: Timer = $AttackTimer
@onready var cooldown_timer: Timer = $CooldownTimer
@onready var target: Player = get_tree().current_scene.get_node("Player") #TODO Need to add pointer to player in spawn manager

func _ready() -> void:
	states = {
		"Idle": $StateMachine/Idle,
		"Moving": $StateMachine/Moving,
		"Prepare": $StateMachine/Prepare,
		"Dash": $StateMachine/Dash,
	}

func _process(delta: float) -> void:
	agent.set_target_position(target.global_position)

	if !agent.is_target_reachable():
		return state_machine.change_state("Idle")
	state_machine.change_state("Moving")

func get_path_point_to_target() -> Vector3:
	var point: Vector3 = agent.get_next_path_position()

	return point
