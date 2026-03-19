@tool
class_name Conteiner_modificador
extends FoldableContainer

@export var novo_modificador: EscolhedorArquivo


var lista_modificadores: ArrayMelhor:
	set(value):
		lista_modificadores = value
		novo_modificador.disabled = false
		lista_modificadores.reactive_changed.connect(atualizar)
		atualizar()


@export var conteiner_modulos: VBoxContainer



func atualizar(valor = null):
	print("a array foi alterada")
	
	for filho in conteiner_modulos.get_children():
		filho.queue_free()
	
	for modificador: Modificador in lista_modificadores.dados:
		print("gerando: ", modificador.nome)
		print(modificador.tipo)
		var cena: PackedScene = load("res://addons/EditorDeCriaturas/Paineis/PainelEspecie/Modulos/SubModulos/SubModulo.tscn")
		var instancia: SubModulo = cena.instantiate()
		instancia.lista_modificadores = lista_modificadores
		instancia.modificador_base = modificador
		conteiner_modulos.add_child(instancia)
	
	print("atualização terminada")


func _on_novo_modificador_arquivo_pego(arquivo: String) -> void:
	var arquivo_carregado: Modificador = load(arquivo).duplicate()
	print("carregando: " + arquivo_carregado.nome)
	lista_modificadores.append(arquivo_carregado)
	
	for iten: Modificador in lista_modificadores.dados:
		print("filho: ", iten.nome)








#
