@tool
class_name Modificador
extends Resource

var dicionario_tipos: Dictionary[String,String] = {
	"Espelhado" = "bool"
}


@export var nome: String:
	set(value):
		nome = value
		descobrir_tipo()
@export var valor: String
var tipo: String
var habilitado: bool = true


func descobrir_tipo():
	tipo = dicionario_tipos[nome]
	print(habilitado)
	print(tipo)
