extends CharacterBody3D

class_name Enemy

@onready var states: Dictionary
@onready var state_machine: StateMachine
@onready var agent: NavigationAgent3D = $NavigationAgent

func die() -> void:
	queue_free()
