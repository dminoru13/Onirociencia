@tool
class_name SubModulo
extends MarginContainer


var modificador_base: Modificador
var endereco: String

var filho: base_sub_modulo
var dicionario_cenas: Dictionary[String, PackedScene] = {
	"bool": load("res://addons/EditorDeCriaturas/PainelLateral/ModuloParte/sub-modulos/modulo_booleano/ModuloBooleano.tscn")
}




func _ready() -> void:
	criar_filho()


func criar_filho():
	print("o tipo é ", modificador_base.tipo)
	filho = dicionario_cenas[modificador_base.tipo].instantiate()
	filho.nome = modificador_base.nome
	filho.endereco = endereco
	filho.valor = modificador_base.endereco
	add_child(filho)







#
