extends Control

@export var fill_time: float
@onready var progress_bar: ProgressBar = $MarginContainer/ProgressBar

func set_bar_value(new_value: float) -> void:
	create_tween().tween_property(progress_bar, "value", new_value, fill_time)
