extends Node

class_name StateMachine

@onready var target: Object = get_parent()

@export var current_state: State

func _process(delta: float) -> void:
	current_state.update_state(delta)

func change_state(next_state: String) -> void:
	var next_state_node: State = target.states[next_state]

	if next_state_node == current_state or !current_state.exit_state(next_state):
		return
	current_state = next_state_node
	current_state.enter_state()
