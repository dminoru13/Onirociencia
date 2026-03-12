@tool
class_name SubModulo
extends MarginContainer

@export var tipo: String
@export var nome: String
@export var endereco: String
@export var dicionario_cenas: Dictionary[String, PackedScene] = {
	"bool": load("res://addons/EditorDeCriaturas/PainelLateral/modulos/modulo_booleano/ModuloBooleano.tscn")
}

var filho: base_sub_modulo


func _ready() -> void:
	criar_filho()


func criar_filho():
	filho = dicionario_cenas[tipo].instantiate()
	filho.nome = nome
	filho.endereco = endereco
	add_child(filho)







#
