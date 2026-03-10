@tool
extends Control

var Modelo

const MINORUS_EXPLORER = preload("uid://dghhtqc7maa0c")

@export var endereco: String = ""
@onready var label_caminho_arquivo: Label = $MarginContainer2/HBoxContainer/ScrollContainer/label_caminho_arquivo
@export_dir var caminho_para_pasta_inicial: String
@export var lista_branca: Array[String]
@export var lista_negra: Array[String]

@export_tool_button("adicionar modelo")
var adicionar_apretado = abrir_explorador




var caminho_arquivo: String
signal peguei_um_arquivo(arquivo, Endereco)

func _ready() -> void:
	if caminho_arquivo == "" :
		caminho_arquivo = "res://"
	custom_minimum_size.y = 31
	

func _on_add_modelo_pressed() -> void:
	abrir_explorador()



func abrir_explorador():
	var janela = Window.new()
	EditorInterface.popup_dialog(janela, Rect2(Vector2(500,230), Vector2(900,700)))
	janela.title = "minorus explorer"
	
	
	var cena_minoru_explorer = MINORUS_EXPLORER.instantiate()
	janela.add_child(cena_minoru_explorer)
	cena_minoru_explorer.arquivo_foi_selecionado.connect(pegar_arquivo)
	cena_minoru_explorer.lista_branca = lista_branca
	cena_minoru_explorer.lista_negra = lista_negra
	cena_minoru_explorer.caminho_para_pasta = caminho_para_pasta_inicial
		
	janela.close_requested.connect(func():
		janela.queue_free()
		)


func pegar_arquivo(caminho, nome):
	label_caminho_arquivo = get_node("MarginContainer2/HBoxContainer/ScrollContainer/label_caminho_arquivo")
	caminho_arquivo = caminho
	label_caminho_arquivo.text = nome
	
	peguei_um_arquivo.emit(caminho, endereco)
	

func atualizar_variaveis():
	var pai = get_parent()
