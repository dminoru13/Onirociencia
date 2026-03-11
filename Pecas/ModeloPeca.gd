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
	var lista_partes = recurso.torso_base.lista_partes
	var novo_torso: PackedScene
	var torso_atual: Node3D
	
	if caminho_modelo != "":
		print("carregando torso")
		novo_torso = load(recurso.torso_base.caminho_modelo)
		var instancia: Node3D = novo_torso.instantiate()
		instancia.name = "torso"
		torso_atual = instancia
		add_child(instancia)
		
	else:
		print("o caminho está vazio")
	
	if lista_partes != []:
		print("----")
		print("iniciando criação dos memebros")
		print("lista partes:")
		print(lista_partes)
		for parte in lista_partes:
			if parte.caminho_modelo != "":
				print("criando ", parte.nome)
				
				var cena_modelo: PackedScene = load(parte.caminho_modelo)
				var modelo: Node3D = cena_modelo.instantiate()
				
				torso_atual.add_child(modelo)
				modelo.position = parte.ancora


func atualizar_partes():
	pass













#
