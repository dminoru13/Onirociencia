@tool
extends EditorPlugin

const Centro = preload("res://addons/EditorDeCriaturas/Central/CentroDeExibicao.tscn")
var instancia_centro


func _enter_tree():
	instancia_centro = Centro.instantiate()
	EditorInterface.get_editor_main_screen().add_child(instancia_centro)
	_make_visible(false)


func _exit_tree():
	if instancia_centro:
		instancia_centro.queue_free()


func _has_main_screen():
	return true


func _make_visible(visible):
	if instancia_centro:
		instancia_centro.visible = visible


func _get_plugin_name():
	return "EDC"


func _get_plugin_icon():
	return preload("res://UI/icones/dna.png")
