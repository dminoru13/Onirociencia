extends Node2D

@export var Modelo : PackedScene
const NodeModelo3D := preload("res://cenas/componentes/Modelo3D.tscn")


var modelo_foi_colocado := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Modelo != null and not has_node("Modelo3D"):
		var filho = NodeModelo3D.instantiate()
		filho.Modelo = Modelo
		add_child(filho)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
