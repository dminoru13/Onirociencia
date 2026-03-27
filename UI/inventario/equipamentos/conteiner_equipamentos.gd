@tool
class_name  ConteinerEquipamento
extends MarginContainer



@export var conteiner_modulos: VBoxContainer

@export var cor1: Color:
	set(v):
		cor1 = v
		colorir()
@export var cor2: Color:
	set(v):
		cor2 = v
		colorir()



func colorir():
	for filho: ModuloEquipamento in conteiner_modulos.get_children():
		filho.cor1 = cor1
		filho.cor2 = cor2
	pass
