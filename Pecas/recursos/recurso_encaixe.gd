@tool
class_name EncaixeRecurso
extends Resource

@export var tipo: String
@export var nome: String
@export var posicao: Vector3
@export var lista_especie: Array[Especie]
@export var lista_modificador: ArrayMelhor = ArrayMelhor.new("lista_modificador")
@export var lista_modificador_universal: Array[Modificador]
