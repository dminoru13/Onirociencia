@tool
class_name Conteiner_modificador
extends FoldableContainer

@export var lista_modificadores: ArrayMelhor = ArrayMelhor.new() 
@export var conteiner_modulos: VBoxContainer


func _ready() -> void:
	lista_modificadores.arrayAlterada.connect(atualizar)

func atualizar():
	print("a array foi alterada")
	
	for filho in conteiner_modulos.get_children():
		filho.queue_free()
	
	for modificador: Modificador in lista_modificadores:
		print("gerando: ", modificador.nome)
		
		var instancia = modificador.dicionario_tipos[modificador.tipo].instantiate()
		
		conteiner_modulos.add_child(instancia)



func _on_novo_modificador_arquivo_pego(arquivo: String) -> void:
	print("carregando: " + arquivo)
	var arquivo_carregado: Modificador = load(arquivo).duplicate()
	print("o nome do arquivo é " + arquivo_carregado.nome)
	lista_modificadores.append(load(arquivo))








#
