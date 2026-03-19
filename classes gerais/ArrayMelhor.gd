@tool
class_name ArrayMelhor
extends Reactive

@export var dados: Array

func append(valor):
	print("eu to appendando: ", valor)
	dados.append(valor)
	reactive_changed.emit(self)

func erase(valor):
	dados.erase(valor)
	reactive_changed.emit(self)

func clear():
	dados.clear()
	reactive_changed.emit(self)
