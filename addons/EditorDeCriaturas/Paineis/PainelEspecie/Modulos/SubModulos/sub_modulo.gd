@tool
class_name SubModulo
extends MarginContainer

var lista_modificadores: ArrayMelhor
var modificador_base: Modificador

func _ready() -> void:
	modificador_base.changed.connect(atualiza)



func _on_check_box_toggled(toggled_on: bool) -> void:
	modificador_base.habilitado = toggled_on
	
func _on_button_pressed() -> void:
	lista_modificadores.erase(modificador_base)

func atualiza():
	print("")
	print("atualizando submodulo")
	print(modificador_base.habilitado)
