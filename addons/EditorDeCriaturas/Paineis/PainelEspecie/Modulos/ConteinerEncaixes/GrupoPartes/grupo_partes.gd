@tool
class_name ModuloGrupoPartes
extends FoldableContainer

@export var encaixe_alvo: EncaixeRecurso
@export var ConteinerOpcoes: VBoxContainer
@export var conteiner_modificadores: ConteinerModificador


func _ready() -> void:
	carregar_opcoes()
	conteiner_modificadores.lista_modificadores = encaixe_alvo.lista_modificador

func carregar_opcoes():
	for especie in encaixe_alvo.lista_especie:
		var cena: PackedScene = load("res://addons/EditorDeCriaturas/Paineis/PainelEspecie/Modulos/ConteinerEncaixes/GrupoPartes/OpcaoParte/OpcaoParte.tscn")
		var instancia: OpcaoParte = cena.instantiate()
		instancia.encaixe = encaixe_alvo
		instancia.escolhedor.alvo = especie.modelo.caminho_modelo.split("/")[-1]
		instancia.especie_anterior = especie
		ConteinerOpcoes.add_child(instancia)

func _on_btn_add_pressed() -> void:
	var cena: PackedScene = load("res://addons/EditorDeCriaturas/Paineis/PainelEspecie/Modulos/ConteinerEncaixes/GrupoPartes/OpcaoParte/OpcaoParte.tscn")
	var instancia: OpcaoParte = cena.instantiate()
	instancia.encaixe = encaixe_alvo
	ConteinerOpcoes.add_child(instancia)
