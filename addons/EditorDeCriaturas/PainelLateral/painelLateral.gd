@tool
class_name PainelLateral
extends Control

@export var Conteiner_modulos: VBoxContainer
const modulo_parte: PackedScene = preload("uid://djnj7ir56a7v5")


func atualizar_painel(lista_partes: Array[Parte]):
	print("")
	print("atualizando painel lateral")
	
	for parte in lista_partes:
		print(parte)
		var novo_modulo: ModuloParte = modulo_parte.instantiate()
		novo_modulo.caminho_para_pasta_inicial = "res://Pecas/modelos3d/Humanoide/Partes"
		novo_modulo.endereco = parte.tipo
		novo_modulo.lista_branca.append(".tscn")
		novo_modulo.parte_base = parte
		Conteiner_modulos.add_child(novo_modulo)
