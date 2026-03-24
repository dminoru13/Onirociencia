@tool
class_name  Reactive
extends Resource

var nome_reactive: String = "sem nome"

var owner : Reactive:
	set(value):
		if owner != null:
			reactive_changed.disconnect(owner._propagate)
		owner = value
		if owner != null:
			reactive_changed.connect(owner._propagate)
			#print("(REACTIVE) ", nome_reactive, " meu dono é: ", owner)
			

signal reactive_changed(reactive)

func _init(nome = null, initial_owner: Reactive = null) -> void:
	if nome is String:
		nome_reactive = nome
	owner = initial_owner
	#print("(REACTIVE) eu ", nome_reactive, " nasci")

func _propagate(_reactive: Reactive = null) -> void:
	reactive_changed.emit(self)
	#print("(REACTIVE) eu ", nome_reactive, " estou propagando")
 
func manually_emit() -> void:
	reactive_changed.emit(self)
