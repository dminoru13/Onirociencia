@tool
class_name ModuloGrupoPartes
extends FoldableContainer

@export var encaixe_alvo: EncaixeRecurso
@export var ConteinerOpcoes: VBoxContainer


func _on_btn_add_pressed() -> void:
	var cena: PackedScene = load("res://addons/EditorDeCriaturas/Paineis/PainelEspecie/Modulos/ConteinerEncaixes/GrupoPartes/OpcaoParte/OpcaoParte.tscn")
	var instancia: OpcaoParte = cena.instantiate()
	instancia.encaixe = encaixe_alvo
	ConteinerOpcoes.add_child(instancia)
