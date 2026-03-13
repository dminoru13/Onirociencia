@tool
class_name ModuloParte
extends FoldableContainer

var parte_base: Parte
@export var conteiner_modulos: VBoxContainer

var mouse_dentro: bool = false


#Conectar Exibidor de arquivos
@export var exibidor_de_arquivos: ExibidordeArquivos
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

#funções auxiliares
func set_endereco():
	if exibidor_de_arquivos:
		exibidor_de_arquivos.endereco = endereco
func set_caminho():
	if exibidor_de_arquivos:
		exibidor_de_arquivos.caminho_para_pasta_inicial = caminho_para_pasta_inicial
func set_branca():
	if exibidor_de_arquivos:
		exibidor_de_arquivos.lista_branca = lista_branca
func set_preta():
	if exibidor_de_arquivos:
		exibidor_de_arquivos.lista_negra = lista_negra
func _ready() -> void:
	set_endereco()
	set_caminho()
	set_branca()
	set_preta()
	
	title = parte_base.nome

func atualizar() -> void:
	caminho_para_pasta_inicial = "res://Pecas/modelos3d/Humanoide/Partes"
	endereco = parte_base.nome
	lista_branca.append(".tscn")
	if parte_base.caminho_modelo != "":
		exibidor_de_arquivos.atualizar_caminho_arquivo(parte_base.caminho_modelo, parte_base.nome)
	
	if parte_base.modificadores_parte:
		aplicar_modificadores()


var lista_sub_modulo: Array[SubModulo] = []

#Modificadores
func aplicar_modificadores():
	for modificador in parte_base.modificadores_parte:
		
		if parte_base.modificadores_desabilitados.has(modificador.nome):
			print("o modificador: ", modificador.nome, " tá desabilitado")
		
		else:
			var submodulo: SubModulo = SubModulo.new()
			submodulo.endereco = parte_base.nome
			submodulo.modificador_base = modificador
			conteiner_modulos.add_child(submodulo)
			lista_sub_modulo.append(submodulo)
			
			












#
