@tool
class_name Roupa
extends Resource

@export var nome: String
@export var tipo: String = "sem tipo atribuido"
@export var esconder_parte_do_corpo: bool
@export var dicionario_modelos: Dictionary[String, Modelo] = {}
