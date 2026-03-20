@tool
class_name ConteinerModificador
extends FoldableContainer

@export var novo_modificador: EscolhedorArquivo


var lista_modificadores: ArrayMelhor:
	set(value):
		lista_modificadores = value
		novo_modificador.disabled = false
		if not lista_modificadores.reactive_changed.is_connected(atualizar):
			lista_modificadores.reactive_changed.connect(atualizar)
		atualizar()


@export var conteiner_modulos: VBoxContainer



func atualizar(valor = null):
	
	for filho in conteiner_modulos.get_children():
		filho.queue_free()
	
	for modificador: Modificador in lista_modificadores.dados:
		var cena: PackedScene = load("res://addons/EditorDeCriaturas/Paineis/PainelEspecie/Modulos/SubModulos/SubModulo.tscn")
		var instancia: SubModulo = cena.instantiate()
		instancia.lista_modificadores = lista_modificadores
		instancia.modificador_base = modificador
		conteiner_modulos.add_child(instancia)
	


func _on_novo_modificador_arquivo_pego(arquivo: String) -> void:
	var arquivo_carregado: Modificador = load(arquivo).duplicate()
	lista_modificadores.append(arquivo_carregado)









#
