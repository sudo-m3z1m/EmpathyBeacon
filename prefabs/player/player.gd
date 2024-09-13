extends CharacterBody3D

class_name Player

@onready var state_machine: StateMachine = $StateMachine
@onready var input_handler: InputHandler = $InputHandler
@onready var model: Node3D = $Model
@onready var interaction_area: Area3D = $InteractionArea

@export var camera: Camera3D

var selected_object: InteractableObject

func _ready() -> void:
	interaction_area.body_entered.connect(change_interact_object_current)

func _process(delta: float) -> void:
	camera.look_at(global_position)

func interact() -> void:
	if !selected_object:
		return
	selected_object.interact(self)
	selected_object.scale /= 1.5

func change_interact_object_current(object: Node3D) -> void:
	if !(object is InteractableObject):
		return
	selected_object = object
	selected_object.scale *= 1.5
