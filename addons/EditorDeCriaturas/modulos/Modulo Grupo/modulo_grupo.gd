@tool
class_name ModuloGrupo
extends FoldableContainer
@export var grupo_base: GrupoDePartes
@export var listaModelos: VBoxContainer


func atualizar():
	for parte in grupo_base:
		var instancia = moduloParte.new()
		instancia.parte_base = parte
		
		listaModelos.add_child(instancia)
	pass

func _on_suicidio_pressed() -> void:
	queue_free()
	print(title, " se matou")
