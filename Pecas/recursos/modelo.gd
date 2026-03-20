@tool
class_name Modelo
extends Reactive

@export var caminho_modelo: String:
	set(v):
		caminho_modelo = v
		print("(MODELO) ", nome_reactive, " mudou o caminho")
		print("(MODELO) o meu dono é: ", owner.nome_reactive)
		reactive_changed.emit()
@export var posicao: Vector3 = Vector3(0,0,0)
@export var key_shape: float
@export var lista_modificador: ArrayMelhor = ArrayMelhor.new("lista_modificador", self)
@export var lista_modificador_universal: ArrayMelhor = ArrayMelhor.new("lista_modificador_universal", self)

func _init(nome = null, initial_owner: Reactive = null) -> void:
	super._init(initial_owner)
	
