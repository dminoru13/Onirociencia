@tool
extends Control

var Modelo

const MINORUS_EXPLORER = preload("uid://dghhtqc7maa0c")

@onready var label_caminho_arquivo: Label = $MarginContainer/HBoxContainer/ScrollContainer/label_caminho_arquivo
@export_dir var caminho_para_pasta_inicial: String

@export var lista_branca: Array[String]
@export var lista_negra: Array[String]

var caminho_arquivo: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_modelo_pressed() -> void:
	var janela = Window.new()
	EditorInterface.popup_dialog(janela, Rect2(Vector2(500,230), Vector2(900,700)))
	janela.title = "minorus explorer"
	
	
	var cena_minoru_explorer = MINORUS_EXPLORER.instantiate()
	janela.add_child(cena_minoru_explorer)
	cena_minoru_explorer.arquivo_foi_selecionado.connect(pegar_arquivo)
	cena_minoru_explorer.lista_branca = lista_branca
	cena_minoru_explorer.lista_negra = lista_negra
	cena_minoru_explorer.caminho_para_pasta = caminho_para_pasta_inicial
	
	
	print(lista_branca)
	print(cena_minoru_explorer.lista_branca)
		
	janela.close_requested.connect(func():
		janela.queue_free()
		)

func pegar_arquivo(caminho, nome):
	print(caminho)
	caminho_arquivo = caminho
	label_caminho_arquivo.text = nome
	
	
	
	
	
	
