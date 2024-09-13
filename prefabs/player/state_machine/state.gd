extends Node

class_name State

@onready var state_machine: StateMachine = get_parent()

@export var target: Node
@export var valid_states: Array[StateMachine.States]

func enter_state() -> void:
	pass

func update_state(delta: float) -> void:
	pass

func exit_state(next_state: StateMachine.States) -> bool:
	return is_state_valid(next_state)

func is_state_valid(next_state: StateMachine.States) -> bool:
	if valid_states.is_empty():
		return true

	for valid_state in valid_states:
		if valid_state == next_state:
			return true 

	return false
