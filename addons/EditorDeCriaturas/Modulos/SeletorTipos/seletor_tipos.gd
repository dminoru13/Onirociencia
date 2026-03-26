@tool
class_name SeletorTipos
extends OptionButton


func _ready() -> void:
	clear()
	for tipo in Global.lita_tipos_partes:
		add_item(tipo)
