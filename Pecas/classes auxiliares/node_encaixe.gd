@tool
class_name EncaixeNode
extends Marker3D

enum tipos {
	PARTE,
	ROUPA
}

@export var tipo: tipos:
	set(v):
		tipo = v
		tipo_string = tipos.keys()[v]

var tipo_string: String = tipos.keys()[0]
