@tool
class_name Especie
extends Resource

@export var nome: String
@export var modelo: Modelo = Modelo.new()
@export var lisra_encaixes: Array[Encaixe]
