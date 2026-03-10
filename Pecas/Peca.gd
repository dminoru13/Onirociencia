class_name  Peca
extends Node3D

@export var Torso_base: Node3D:
	set(value):
		Torso_base = value
		atualizar_torso()

@export var lista_partes: Array[Parte]


func atualizar_torso():
	print("recebi um torço aqui")

	for filho in get_children():
		filho.queue_free()
		
	
	add_child(Torso_base)


func atualizar_partes():
	print("atualizando partes")
	lista_partes.clear()
	print("array limpa")
	for filho in Torso_base.get_children():
		if filho is encaixePeca:
			var parte = Parte.new()
			parte.encaixe = filho
			parte.caracteristicas.nome = filho.name
			lista_partes.append(parte)
			print(parte.caracteristicas.nome)













#
