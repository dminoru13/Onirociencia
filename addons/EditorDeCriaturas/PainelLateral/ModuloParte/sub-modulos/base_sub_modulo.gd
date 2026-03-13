extends Control
class_name base_sub_modulo

var endereco: String
var modificador_base: Modificador

@export var botao_fechar: Button

signal variavel_mudou(endereco: String, modificador: Modificador)

func passar_informacoes():
	variavel_mudou.emit(endereco, modificador_base)
