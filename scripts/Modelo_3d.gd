extends Node2D

@export var conteiner_modelo : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func modelar(modelo: PackedScene):
	if modelo == null:
		print("não tem modelo")
		return
	
	if conteiner_modelo == null:
		print("não tem onde colocar o modelo")
		return
	
	var instancia := modelo.instantiate() as Node3D
	conteiner_modelo.add_child(instancia)
	print("modelo colocado")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
