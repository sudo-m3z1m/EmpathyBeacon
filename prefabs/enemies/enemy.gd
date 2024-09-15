extends CharacterBody3D

class_name Enemy

@onready var states: Dictionary
@onready var state_machine: StateMachine = $StateMachine
@onready var agent: NavigationAgent3D = $NavigationAgent
@onready var target: Player = get_tree().current_scene.get_node("Player") #TODO Need to add pointer to player in spawn manager

func die() -> void:
	queue_free()

func get_path_point_to_target() -> Vector3:
	var point: Vector3 = agent.get_next_path_position()

	return point
