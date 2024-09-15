extends Node

class_name InputHandler

@onready var target: Object = get_parent()
@onready var state_machine = get_parent().get_node("StateMachine")
@onready var select_component: SelectComponent = get_parent().get_node("SelectComponent")
@onready var weapon_component: WeaponComponent = get_parent().get_node("WeaponComponent")

var actions_array: Array[String] = [
	"Interact",
	"Shoot"
]

func _unhandled_input(event: InputEvent) -> void:
	for action in actions_array:
		if !event.is_action_pressed(action):
			continue
		apply_action(action)

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

func apply_action(action: String) -> void:
	match action:
		"Interact":
			select_component.interact()
		"Shoot":
			weapon_component.shoot()
