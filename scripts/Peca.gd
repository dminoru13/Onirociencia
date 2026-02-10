extends Node2D

@export var Modelo3D : PackedScene
var modelo_foi_colocado := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Modelo3D:
		pass
	print("tá pronto")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if modelo_foi_colocado == false:
		if has_node("Modelo3d") and Modelo3D:
			print("modelo foi passado")
			$"Modelo3d".modelar(Modelo3D)
			modelo_foi_colocado = true
