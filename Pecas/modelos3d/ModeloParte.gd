@tool
class_name  ModeloParte
extends Node3D

var parte_base: Parte:
	set(value):
		parte_base = value
		carregar_modelo()
		parte_atribuida.emit(value)
		parte_base.connect("novas_roupas", atualizar_roupas)
var instancia: Node3D

signal parte_atribuida(parte: Parte)


func carregar_modelo():
	for crianca in get_children():
		crianca.queue_free()
	
	var caminho_modelo: String = parte_base.modelo.caminho_modelo
	
	if caminho_modelo != "":
		var modelo_carregado: PackedScene = load(caminho_modelo)
		instancia = modelo_carregado.instantiate()
		instancia.position = parte_base.modelo.posicao
		add_child(instancia)
	
		if parte_base.lista_parte != []:
			for parte in parte_base.lista_parte:
				var modelo_filho = ModeloParte.new()
				modelo_filho.parte_base = parte
				instancia.add_child(modelo_filho)
	
	atualizar_modificadores()

func atualizar_modificadores():
	var lista_modificadores: ArrayMelhor = parte_base.modelo.lista_modificador
	
	for modificador: Modificador in lista_modificadores.dados:
		if modificador.habilitado == true:
			if modificador.nome == "espelhado":
				instancia.scale.z = -1

func atualizar_roupas():
	print("(ModeloParte) atualizando roupas")
	
	for filho in get_children():
		if filho is ModeloRoupa:
			filho.queue_free()
	
	for roupa: Roupa in parte_base.roupas.values():
		if roupa:
			if roupa.dicionario_modelos.has(parte_base.tipo):
				var cena: PackedScene = load(roupa.dicionario_modelos[parte_base.tipo].caminho_modelo)
				var instancia_roupa: Node3D = cena.instantiate()
				add_child(instancia_roupa)





#
