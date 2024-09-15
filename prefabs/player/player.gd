extends CharacterBody3D

class_name Player

@export var gravity: float

@onready var state_machine: StateMachine = $StateMachine
@onready var input_handler: InputHandler = $InputHandler
@onready var model: Node3D = $Model

var direction: Vector3

@onready var states: Dictionary = {
	"Idle": $StateMachine/Idle,
	"Moving": $StateMachine/Moving
}

func _process(delta: float) -> void:
	velocity.y -= gravity
	change_moving_state()

func change_moving_state() -> void:
	direction = input_handler.get_moving_input().normalized()
	
	if !direction:
		return state_machine.change_state("Idle")
	
	state_machine.change_state("Moving")

func die() -> void: pass
