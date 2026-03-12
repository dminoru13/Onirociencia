@tool
class_name PainelLateral
extends Control

@export var Conteiner_modulos: VBoxContainer
const modulo_parte: PackedScene = preload("uid://djnj7ir56a7v5")

signal arquivo_recebido(arquivo: String, endereco: String)

func atualizar_painel(lista_partes: Array[Parte]):
	
	for filhos in Conteiner_modulos.get_children():
		filhos.queue_free()
	
	for parte in lista_partes:
		var novo_modulo: ModuloParte = modulo_parte.instantiate()
		novo_modulo.caminho_para_pasta_inicial = "res://Pecas/modelos3d/Humanoide/Partes"
		novo_modulo.endereco = parte.nome
		novo_modulo.lista_branca.append(".tscn")
		novo_modulo.parte_base = parte
		Conteiner_modulos.add_child(novo_modulo)
		novo_modulo.exibidor_de_arquivos.peguei_um_arquivo.connect(enviar_arquivo)

func enviar_arquivo(arquivo: String, endereco: String):
	arquivo_recebido.emit(arquivo, endereco)
