@tool
class_name Parte
extends Reactive

@export var nome: String
@export var modelo: Modelo
@export var lista_parte: Array[Parte]

func _init() -> void:
	super._init()
