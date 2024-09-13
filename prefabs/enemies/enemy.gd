extends CharacterBody3D

class_name Enemy

@export var max_speed: float
@export var acceleration_weight: float

#@onready var state_machine: StateMachine
@onready var agent: NavigationAgent3D = $NavigationAgent

var target: Object
var direction: Vector3

func _ready() -> void:
	target = get_parent().get_node_or_null("Player")

func _process(delta: float) -> void:
	agent.set_target_position(target.global_position)
	
	direction = (agent.get_next_path_position() - global_position).normalized()
	velocity = lerp(velocity, direction * max_speed, acceleration_weight)
	
	move_and_slide()
