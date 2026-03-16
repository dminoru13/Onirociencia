@tool
extends EditorPlugin

const Centro = preload("res://addons/EditorDeCriaturas/CentroDeExibicao.tscn")
var instancia_centro


func _enter_tree():
	_make_visible(false)


func _exit_tree():
	pass


func _has_main_screen():
	return true


func _make_visible(visible):
	if instancia_centro:
		instancia_centro.visible = visible
	
	if visible:
		instancia_centro = Centro.instantiate()
		EditorInterface.get_editor_main_screen().add_child(instancia_centro)
	
	else:
		if instancia_centro:
			instancia_centro.queue_free()


func _get_plugin_name():
	return "EDC"


func _get_plugin_icon():
	return preload("res://UI/icones/dna.png")
