extends Control
class_name base_sub_modulo

@export var endereco: String
@export var nome: String
var valor

signal variavel_mudou(endereco: String, nome: String, dicionario_variaveis: Dictionary[String, String])

func passar_informacoes():
	variavel_mudou.emit(endereco, nome, valor)
