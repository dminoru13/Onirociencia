class_name Gira_gira extends Node3D


@export var velocidade := 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var pai = get_parent_node_3d()
	
	pai.rotate_y(velocidade * delta)
