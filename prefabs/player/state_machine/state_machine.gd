extends Node

class_name StateMachine

@onready var target: Object = get_parent()
@onready var input_handler: InputHandler = get_parent().get_node("InputHandler")

@onready var current_state: State = $Idle

@onready var states: Dictionary = {
	States.IDLE: $Idle,
	States.MOVING: $Moving
}

enum States {
	IDLE,
	MOVING
}

var direction: Vector3

func _process(delta: float) -> void:
	current_state.update_state(delta)
	direction = input_handler.get_moving_input()
	
	if !direction:
		return change_state(States.IDLE)
	
	change_state(States.MOVING)

func change_state(next_state: States) -> void:
	if states[next_state] == current_state or !current_state.exit_state(next_state):
		return
	current_state = states[next_state]
	current_state.enter_state()
