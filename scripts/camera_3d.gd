@tool
extends XRCamera3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	projection = Camera3D.PROJECTION_ORTHOGONAL


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
