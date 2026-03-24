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
				print("parte: ",parte.nome, " ", parte.modelo.posicao)
				print("modelo filho: ",modelo_filho.parte_base.nome, " ", modelo_filho.position)
				instancia.add_child(modelo_filho)
	
	atualizar_modificadores()


func atualizar_modificadores():
	print("(MODELO PECA) a peca foi alterada")
	var lista_modificadores: ArrayMelhor = parte_base.modelo.lista_modificador
	
	for modificador: Modificador in lista_modificadores.dados:
		if modificador.habilitado == true:
			if modificador.nome == "espelhado":
				instancia.scale.z = -1
		






#
