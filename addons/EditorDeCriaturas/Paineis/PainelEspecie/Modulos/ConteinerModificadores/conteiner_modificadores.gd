@tool
class_name Conteiner_modificador
extends FoldableContainer

@export var lista_modificadores: ArrayMelhor = ArrayMelhor.new() 


func _ready() -> void:
	lista_modificadores.arrayAlterada.connect(atualizar)

func atualizar():
	for item in lista_modificadores.dados:
		print(item)
	
