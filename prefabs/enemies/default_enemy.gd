extends Enemy

@onready var attack_timer: Timer = $AttackTimer
@onready var cooldown_timer: Timer = $CooldownTimer
@onready var attack_area: Area3D = $AttackArea

var last_target_position: Vector3

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
