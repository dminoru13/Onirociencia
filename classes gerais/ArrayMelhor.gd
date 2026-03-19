class_name ArrayMelhor
extends  Resource

var dados: Array = []
signal arrayAlterada

func append(valor):
	dados.append(valor)
	arrayAlterada.emit()

func erase(valor):
	dados.erase(valor)
	arrayAlterada.emit()

func clear():
	dados.clear()
	arrayAlterada.emit()
