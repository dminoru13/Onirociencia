@tool
extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED:
		custom_minimum_size.x = size.y*1.5

func _process(delta: float) -> void:
	custom_minimum_size.x = size.y*1.5
