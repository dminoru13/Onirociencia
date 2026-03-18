@tool
class_name Modificador
extends Resource

@export var nome: String
@export var tipo: String

var dicionario_tipos: Dictionary[String, PackedScene] = {
	"bool": load("res://addons/EditorDeCriaturas/Paineis/PainelEspecie/Modulos/Boleano/ModuloBoleano.tscn"),
	"slideBar": load("res://addons/EditorDeCriaturas/Paineis/PainelEspecie/Modulos/SlideBar/ModuloSlideBar.tscn")
}
