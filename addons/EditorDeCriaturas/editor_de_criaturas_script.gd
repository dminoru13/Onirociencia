@tool
extends EditorPlugin


var toolbar

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	toolbar = preload("res://addons/EditorDeCriaturas/EDC.tscn").instantiate()
	
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_BL, toolbar)
	pass


func _exit_tree() -> void:
	remove_control_from_docks(toolbar)
	
	toolbar.free()
	pass
