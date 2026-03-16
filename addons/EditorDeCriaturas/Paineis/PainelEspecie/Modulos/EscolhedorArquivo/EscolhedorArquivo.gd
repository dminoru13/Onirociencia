@tool
class_name EscolhedorArquivo
extends Button


@export var texto_fixo: bool
@export_dir var caminho_pasta: String
@export var final_arquivo: String

var caminho_arquivo: String
var nome_arquivo: String
var alvo: String

signal arquivoPego(arquivo: String)

var janela: Window

func _ready() -> void:
	pressed.connect(apertado)
	
	if texto_fixo == false:
		text = "(Selecionar modelo)"

func apertado() -> void:
	if janela:
		janela.queue_free()
	janela = Window.new()
	
	var pos_janela = Vector2(350, 200)
	var cena_explorador: PackedScene = preload("res://addons/EditorDeCriaturas/ExploradorDeArquivos/MinorusExplorer.tscn")
	var explorador: MinorusExplorer = cena_explorador.instantiate()
	
	explorador.posicao = pos_janela
	
	janela.add_child(explorador)
	
	EditorInterface.popup_dialog(janela, Rect2(pos_janela, Vector2(900,600)))
	
	
	explorador.connect("arquivo_foi_selecionado", atualizar)
	
	if caminho_pasta != "":
		explorador.caminho_para_pasta = caminho_pasta
	
	explorador.lista_branca.append(final_arquivo)
	
	janela.close_requested.connect(func():
		janela.queue_free())




func atualizar(caminho: String, nome: String):
	caminho_arquivo = caminho
	nome_arquivo = nome
	alvo = caminho + nome
	
	arquivoPego.emit(alvo)
	
	if texto_fixo == false:
		text = nome









#
