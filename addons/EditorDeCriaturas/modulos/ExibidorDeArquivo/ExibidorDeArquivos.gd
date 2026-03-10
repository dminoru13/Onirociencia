@tool
class_name ExibidorDeArquivos
extends Control

@export var endereco: String = "":
	set(value):
		endereco = value
		atualizar_endereco()

@export_dir var caminho_para_pasta_inicial: String:
	set(value):
		caminho_para_pasta_inicial = value
		atualizar_caminho()
		
@export var lista_branca: Array[String]:
	set(value):
		lista_branca = value
		atualizar_branca()
		
@export var lista_negra: Array[String]:
	set(value):
		lista_negra = value
		atualizar_preta()

var filho



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	custom_minimum_size.y = 31
	
	var cena_alvo = load("res://addons/EditorDeCriaturas/modulos/ExibidorDeArquivo/CenaModelo/ModeloExibirArquivos.tscn")
	filho = cena_alvo.instantiate()
	add_child(filho)
	
	atualizar_endereco()
	atualizar_caminho()
	atualizar_branca()
	atualizar_preta()


func atualizar_endereco():
	if filho:
		filho.endereco = endereco

func atualizar_caminho():
	if filho:
		filho.caminho_para_pasta_inicial = caminho_para_pasta_inicial

func atualizar_branca():
	if filho:
		filho.lista_branca = lista_branca

func atualizar_preta():
	if filho:
		filho.lista_negra = lista_negra
