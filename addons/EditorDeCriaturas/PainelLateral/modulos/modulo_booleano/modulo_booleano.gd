@tool
extends base_sub_modulo

@export var check_box: CheckBox
@export var label_nome: Label


func _ready() -> void:
	label_nome.text = nome
	valor = false

func _on_check_box_toggled(toggled_on: bool) -> void:
	valor = toggled_on
	passar_informacoes()
