@tool
class_name ModuloParte
extends FoldableContainer

var parte_base: Parte:
	set(value):
		parte_base = value
		set_parte()



#Conectar Exibidor de arquivos
var exibidor_de_arquivos: ExibidordeArquivos
@export var endereco: String = "":
	set(value):
		endereco = value
		set_endereco()
@export_dir var caminho_para_pasta_inicial: String:
	set(value):
		caminho_para_pasta_inicial = value
		set_caminho()
@export var lista_branca: Array[String]:
	set(value):
		lista_branca = value
		set_branca()
@export var lista_negra: Array[String]:
	set(value):
		lista_negra = value
		set_preta()
func set_endereco():
	if exibidor_de_arquivos:
		exibidor_de_arquivos.endereco = endereco
func set_caminho():
	if exibidor_de_arquivos:
		print(caminho_para_pasta_inicial)
		exibidor_de_arquivos.caminho_para_pasta_inicial = caminho_para_pasta_inicial
func set_branca():
	if exibidor_de_arquivos:
		exibidor_de_arquivos.lista_branca = lista_branca
func set_preta():
	if exibidor_de_arquivos:
		exibidor_de_arquivos.lista_negra = lista_negra


func _ready() -> void:
	exibidor_de_arquivos = $VBoxContainer/ExibidordeArquivos
	
	set_endereco()
	set_caminho()
	set_branca()
	set_preta()
	
	title = parte_base.nome



func set_parte():
	pass
