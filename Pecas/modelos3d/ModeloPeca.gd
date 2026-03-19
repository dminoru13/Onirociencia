@tool
class_name  ModeloParte
extends Node3D

var parte_base: Parte:
	set(value):
		parte_base = value
		carregar_modelo()

var instancia: Node3D

func carregar_modelo():
	for crianca in get_children():
		crianca.queue_free()
	
	var modelo_carregado: PackedScene = load(parte_base.modelo.caminho_modelo)
	instancia = modelo_carregado.instantiate()
	instancia.position = parte_base.modelo.posicao
	add_child(instancia)
	
	atualizar_modificadores()


func atualizar_modificadores():
	print("a peca foi alterada")
	var lista_modificadores: ArrayMelhor = parte_base.modelo.lista_modificador
	
	for modificador: Modificador in lista_modificadores.dados:
		if modificador.habilitado == true:
			if modificador.nome == "espelhado":
				instancia.scale.z = -1
		






#
