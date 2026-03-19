@tool
class_name Modelo
extends Reactive

@export var caminho_modelo: String
@export var posicao: Vector3 = Vector3(0,0,0)
@export var key_shape: float
@export var lista_modificador: ArrayMelhor = ArrayMelhor.new(self)
@export var lista_modificador_universal: ArrayMelhor = ArrayMelhor.new(self)

func _init() -> void:
	super._init()
