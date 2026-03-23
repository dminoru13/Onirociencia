@tool
class_name  ConteinerEncaixe
extends FoldableContainer


@export var conteiner_grupos: VBoxContainer



var lista_encaixes: ArrayMelhor: 
	set(value):
		lista_encaixes = value
		atualizar()


func atualizar():
	if lista_encaixes.dados != []:
		print("(CONTEINER ENCAIXES) criando encaixes")
	for encaixe: EncaixeRecurso in lista_encaixes.dados:
		print("(ConteinerEncaixe) encaixe encontrad0: ", encaixe.nome)
		
		var cena: PackedScene = load("res://addons/EditorDeCriaturas/Paineis/PainelEspecie/Modulos/ConteinerEncaixes/GrupoPartes/ModuloGrupoPartes.tscn")
		var instancia: ModuloGrupoPartes = cena.instantiate()
		instancia.encaixe_alvo = encaixe
		instancia.title = encaixe.nome
		conteiner_grupos.add_child(instancia)
