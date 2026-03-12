@tool
class_name ExibidordeArquivos
extends Control



const MINORUS_EXPLORER = preload("uid://dghhtqc7maa0c")
var Modelo
var label_caminho_arquivo: Label
var MODELO_EXIBIR_ARQUIVOS: PackedScene
@export var endereco: String = ""
@export_dir var caminho_para_pasta_inicial: String
@export var lista_branca: Array[String]
@export var lista_negra: Array[String]

func atualizar_variaveis():
	var pai = get_parent()



var caminho_arquivo: String
signal peguei_um_arquivo(arquivo: String, endereco:String)

func _ready() -> void:
	MODELO_EXIBIR_ARQUIVOS = load("uid://b8niqtf4udnhp")
	var instancia = MODELO_EXIBIR_ARQUIVOS.instantiate()
	add_child(instancia)
	label_caminho_arquivo  = $ModeloExibidorArquivos/MarginContainer2/HBoxContainer/ScrollContainer/label_caminho_arquivo
	instancia.botao.pressed.connect(abrir_explorador)

	if caminho_arquivo == "" :
		caminho_arquivo = "res://"
	custom_minimum_size.y = 31	


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


func pegar_arquivo(caminho: String, nome: String):
	atualizar_caminho_arquivo(caminho + nome, nome)
	peguei_um_arquivo.emit(caminho + nome, endereco)

func atualizar_caminho_arquivo(caminho, nome):
	caminho_arquivo = caminho
	label_caminho_arquivo.text = nome














#
