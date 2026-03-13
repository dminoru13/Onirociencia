@tool
extends base_sub_modulo

@export var check_box: CheckBox
@export var label_nome: Label


func _ready() -> void:
	label_nome.text = nome
	check_box.button_pressed = (valor == "true")

func _on_check_box_toggled(toggled_on: bool) -> void:
	valor = str(toggled_on)
	passar_informacoes()


func _on_button_pressed() -> void:
	pass # Replace with function body.
