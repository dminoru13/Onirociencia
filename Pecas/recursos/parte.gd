@tool
class_name Parte
extends Reactive

@export var nome: String
@export var modelo: Modelo:
	set(v):
		modelo = v
		modelo.owner = self
@export var lista_parte: Array[Parte]

func _init() -> void:
	super._init()
