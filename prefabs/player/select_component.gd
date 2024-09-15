extends Node3D

class_name SelectComponent

@onready var selection_area: Area3D = $SelectionArea

func _ready() -> void:
	selection_area.body_entered.connect(object_entered)
	selection_area.body_exited.connect(object_exited)

func object_entered(object: Node3D) -> void:
	pass

func object_exited(object: Node3D) -> void:
	pass

func set_indicate_object(object: InteractableObject, is_indicated: bool) -> void:
	pass

func interact() -> void:
	pass
