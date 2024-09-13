extends Node

class_name InputHandler

@onready var target: Object = get_parent()
@onready var state_machine = get_parent().get_node("StateMachine")

func _unhandled_input(event: InputEvent) -> void:
	if !event.is_action_pressed("Interact"):
		return
	target.interact()

func get_moving_input() -> Vector3:
	var direction: Vector3 = Vector3.ZERO

	if Input.is_action_pressed("Forward"):
		direction.z -= 1
	if Input.is_action_pressed("Back"):
		direction.z += 1
	if Input.is_action_pressed("Left"):
		direction.x -= 1
	if Input.is_action_pressed("Right"):
		direction.x += 1

	return direction
