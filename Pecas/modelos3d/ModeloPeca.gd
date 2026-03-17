@tool
class_name  ModeloParte
extends Node3D

var parte_base: Parte:
	set(value):
		parte_base = value
		carregar_modelo()

func carregar_modelo():
	for crianca in get_children():
		crianca.queue_free()
	
	var modelo_carregado: PackedScene = load(parte_base.modelo.caminho_modelo)
	var instancia: Node3D = modelo_carregado.instantiate()
	instancia.position = parte_base.modelo.posicao
	add_child(instancia)









#
