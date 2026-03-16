@tool
extends Control
class_name MinorusExplorer

@onready var grid_container: GridContainer = $VBoxContainer/MarginContainer2/ScrollContainer/GridContainer
@onready var scroll_container: ScrollContainer = $VBoxContainer/MarginContainer2/ScrollContainer
@onready var barra_pesquisa: TextEdit = get_node("VBoxContainer/MarginContainer/HBoxContainer/barraPesquisa")
@export var modulo_arquivo := preload("res://addons/EditorDeCriaturas/exploradorDeArquivos/ModuloArquivoGeral.tscn")

var tamanho_tela = size
var tamanho_anterior

var janela: Window
var posicao: Vector2

var tamanho_modulo := 160.0
@export var caminho_para_pasta: String = "":
	set(value):
		caminho_para_pasta = value
		barra_pesquisa.text = caminho_para_pasta
		atualizar()

@export var lista_negra: Array[String]
@export var lista_branca: Array[String]

var modulo_selecionado: String
var arquivos: Array


#FUNÇÕES

#GRADE

func _process(delta: float) -> void:
	tamanho_tela = size
	if tamanho_tela != tamanho_anterior:
		tamanho_anterior = tamanho_tela
		atualizar_grade()

func atualizar_grade():
	grid_container.columns = floor((size.x+50) / tamanho_modulo )


#PESQUISA DE ARQUIVOS

func _ready() -> void:
	barra_pesquisa.text = caminho_para_pasta
	
	if barra_pesquisa.text == "":
		barra_pesquisa.text = "res://"
	atualizar()

func _on_pesquisar_pressed() -> void:
	atualizar()

func atualizar():
	arquivos.clear()
	for filhos in grid_container.get_children():
		filhos.queue_free()
	
	pesquisar(barra_pesquisa.text)

func pesquisar(pesquisa: String):
	var pasta = DirAccess.open(pesquisa)
	if pasta:
		pasta.list_dir_begin()
		var nome_arquivo = pasta.get_next()
		while nome_arquivo != "":
			arquivos.append(nome_arquivo)
			
			var e_uma_pasta := false
			if pasta.current_is_dir():
				e_uma_pasta = true
			
			criar_modulos(nome_arquivo, pesquisa + "/" + nome_arquivo, e_uma_pasta)
			nome_arquivo = pasta.get_next()

func criar_modulos(nome: String, caminho, e_uma_pasta):
	
	for iten in lista_negra:
		if nome.ends_with(iten):
			return
	
	var ta_na_lista_pode_passar: bool = false
	
	for iten in lista_branca:
		if nome.ends_with(iten):
			ta_na_lista_pode_passar = true
	
	if ta_na_lista_pode_passar or lista_branca.size() == 0 or e_uma_pasta:
		var cena_modulo: ModuloArquivo = modulo_arquivo.instantiate()
		cena_modulo.texto_arquivo = nome
		cena_modulo.caminho_arquivo = caminho
		cena_modulo.e_uma_pasta = e_uma_pasta
		grid_container.add_child(cena_modulo)
		
		cena_modulo.apertou.connect(filho_apertado)

func _on_botao_voltar_pressed() -> void:
	var partes: Array = barra_pesquisa.text.split("/", false)
	partes.pop_back()
	var tamanho_partes: int = partes.size()
	var texto_final: String = ""
	
	if tamanho_partes == 0:
		return
	elif tamanho_partes == 1:
		texto_final = "".join(partes) + "//"
	elif tamanho_partes == 2:
		texto_final = "//".join(partes)
	else:
		texto_final = "//".join(partes)
	
	barra_pesquisa.text = texto_final
	atualizar()

signal arquivo_foi_selecionado(caminho, nome)

func filho_apertado(nome, pasta):
	
	if pasta:
		barra_pesquisa.text = barra_pesquisa.text + "/" + nome
		atualizar()
	
	else:
		if barra_pesquisa.text != "res://":
			arquivo_foi_selecionado.emit(barra_pesquisa.text +"/", nome)
		
		else:
			arquivo_foi_selecionado.emit("res://", nome)
		
		get_parent().queue_free()


# criar novo arquivo


func _exit_tree() -> void:
	if janela:
		janela.queue_free()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			if janela:
				janela.queue_free()
			janela = Window.new()
			
			janela.set_flag(Window.FLAG_BORDERLESS, true)
			
			var cena: PackedScene = load("res://addons/EditorDeCriaturas/ExploradorDeArquivos/painel_criar.tscn")
			var instancia: PainelCriar = cena.instantiate()
			instancia.caminho = barra_pesquisa.text
			instancia.connect("arquivoCriado", atualizar)
			janela.add_child(instancia)
			
			var mouse_pos = get_viewport().get_mouse_position()
			
			EditorInterface.popup_dialog(janela, Rect2(mouse_pos + posicao, Vector2(300,300)))
			
			
			
			janela.close_requested.connect(func():
				janela.queue_free())
		
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if janela:
				janela.queue_free()

#
