@tool

class_name  ModeloPeca
extends Node3D

@export var recurso: RecursoPeca:
	set(value):
		recurso = value
		atualizar()


func atualizar():
	print("atualizando peca")
	recurso.torso_base.atualizar_caracteristicas()
	
	for filho in get_children():
		filho.queue_free()
	
	var caminho_modelo = recurso.torso_base.caminho_modelo
	var novo_torso: PackedScene
	
	if caminho_modelo != "":
		print("carregando torso")
		novo_torso = load(recurso.torso_base.caminho_modelo)
		var instancia = novo_torso.instantiate()
		add_child(instancia)
	
	else:
		print("o caminho está vazio")


func atualizar_partes():
	pass













#
