@tool
extends Node2D

const NodeModelo3D := preload("res://cenas/componentes/Modelo3D.tscn")

@export var Modelo : PackedScene
@export var Posicao := Vector2i.ZERO:
	set(value):
		Posicao = value
		_atualizar_posicao_hex()


var modelo_foi_colocado := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Modelo != null and not has_node("Modelo3D"):
		var filho = NodeModelo3D.instantiate()
		filho.Modelo = Modelo
		add_child(filho)
	_atualizar_posicao_hex()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _atualizar_posicao_hex():
	if Posicao != $PosicaoHex.posicao_hexagonal:
		$PosicaoHex.posicao_hexagonal = Posicao
