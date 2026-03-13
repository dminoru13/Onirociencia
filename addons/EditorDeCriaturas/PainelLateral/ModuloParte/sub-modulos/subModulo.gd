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
	filho = dicionario_cenas[modificador_base.tipo].instantiate()
	filho.endereco = endereco
	filho.modificador_base = modificador_base
	add_child(filho)
	
	filho.botao_fechar.connect("pressed", desabilitar)


func desabilitar():
	filho.modificador_base.habilitado = false
	filho.passar_informacoes()



#
