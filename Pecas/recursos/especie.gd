@tool
class_name Especie
extends Reactive

@export var nome: String
@export var modelo: Modelo = Modelo.new()
@export var lisra_encaixes: Array[Encaixe]

func _init() -> void:
	super._init()
