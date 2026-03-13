@tool
class_name PainelLateral
extends Control

@export var Conteiner_modulos: VBoxContainer
const modulo_parte: PackedScene = preload("res://addons/EditorDeCriaturas/PainelLateral/ModuloParte/ModuloParte.tscn")

signal arquivo_recebido(arquivo: String, endereco: String)
signal modificadores_alterados(endereco: String, nome: String, valor)

func atualizar_painel(recurso: RecursoPeca):
	
	var lista_partes: Array[Parte] = recurso.torso_base.lista_partes
	
	for filhos in Conteiner_modulos.get_children():
		filhos.queue_free()
	
	for parte in lista_partes:
		var novo_modulo: ModuloParte = modulo_parte.instantiate()
		novo_modulo.parte_base = parte
		Conteiner_modulos.add_child(novo_modulo)
		novo_modulo.atualizar()
		novo_modulo.exibidor_de_arquivos.peguei_um_arquivo.connect(enviar_arquivo)
		
		for sub_modulo in novo_modulo.lista_sub_modulo:
			sub_modulo.filho.connect("variavel_mudou", atualizar_modificadores)
		

func atualizar_modificadores(endereco: String, nome: String, valor):
	modificadores_alterados.emit(endereco, nome, valor)


func enviar_arquivo(arquivo: String, endereco: String):
	arquivo_recebido.emit(arquivo, endereco)
