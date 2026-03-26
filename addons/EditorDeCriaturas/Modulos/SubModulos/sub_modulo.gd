@tool
class_name SubModulo
extends MarginContainer

@export var lbl_nome: Label
@export var check_habilitado: CheckBox



var lista_modificadores: ArrayMelhor
var modificador_base: Modificador

func _ready() -> void:
	modificador_base.changed.connect(atualiza)
	lbl_nome.text = modificador_base.nome
	check_habilitado.button_pressed = modificador_base.habilitado



func _on_check_box_toggled(toggled_on: bool) -> void:
	modificador_base.habilitado = toggled_on
	
func _on_button_pressed() -> void:
	lista_modificadores.erase(modificador_base)

func atualiza():
	pass
