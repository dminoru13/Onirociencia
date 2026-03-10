@tool
extends Control


@export_tool_button("testar")
var apertou_testar = testar

@export var ArrayDeGrupos: Array[GrupoDePartes]


@onready var conteiner_modulos: VBoxContainer = $MarginContainer/VBoxContainer/MarginContainer2/VBoxContainer/ScrollContainer/ConteinerModulos
@onready var ArquivoTorsoBase := $MarginContainer/VBoxContainer/MarginContainer2/VBoxContainer/MarginContainer/VBoxContainer/ExibidorDeArquivos/ModeloExibidorArquivos
@onready var btn_atualizar: Button = $MarginContainer/VBoxContainer/MarginContainer2/VBoxContainer/ConteinerButao/MarginContainer/atualizar
@onready var btn_limpar: Button = $MarginContainer/VBoxContainer/MarginContainer2/VBoxContainer/ConteinerButao/MarginContainer2/limpar


func testar():
	print(ArquivoTorsoBase)



func _on_atualizar_pressed() -> void:
	pass

func atualizar():
	for grupo in ArrayDeGrupos:
		criar_grupo_objeto(grupo)
	
	for grupo in conteiner_modulos:
		grupo.atualizar()
		print(grupo, " foi atualizado")

func _on_limpar_pressed() -> void:
	print("iniciando limpeza")
	for filho in conteiner_modulos.get_children():
		print(filho.name, " foi morto")
		filho.queue_free()
	
	print("limpo")

func criar_parte():
	var parte_teste = Parte.new()
	parte_teste.caracteristicas.caminho_modelo = "res://Pecas/Humanoide/Partes/Braco/braco.tscn"
	parte_teste.caracteristicas.posicao = "2,3,5"
	adicionar_parte(parte_teste)

func adicionar_parte(parte:Parte):
	print("adicionando parte: ", parte)
	parte.atualizar_caracteristicas()
	print("o grupo dessa parte é: ", parte.caracteristicas.tipo)
	
	for Grupo in ArrayDeGrupos:
		print("o grupo:", Grupo.nome, "tem o mesmo nome do tipo: ", parte.caracteristicas.tipo)
		if Grupo.nome == parte.caracteristicas.tipo:
			Grupo.listaPartes.append(parte)
		
		else:
			print("o grupo:", Grupo.none, "ainda não existe")
			criar_grupo_array(parte)
	
	if ArrayDeGrupos == []:
		print("a array base está vazia")
		criar_grupo_array(parte)
	
	notify_property_list_changed()

func criar_grupo_array(parte: Parte):
	print("criando grupo: ", parte.caracteristicas.tipo)
	var novo_grupo = GrupoDePartes.new()
	novo_grupo.nome = parte.caracteristicas.tipo
	novo_grupo.listaPartes.append(parte)
	ArrayDeGrupos.append(novo_grupo)

func criar_grupo_objeto(grupo: GrupoDePartes):
	var instancia := ModuloGrupo.new()
	conteiner_modulos.add_child(instancia)
	print("atualizando")
