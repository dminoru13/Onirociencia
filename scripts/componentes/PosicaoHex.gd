@tool
extends Node2D

@export var posicao_hexagonal := Vector2i(0,0)
var altura := 0
var pai

func hexagono_para_quadrado(pos_hex: Vector2i):
	var largura = Global.get_largura_hexagono()
	var altura_hex = Global.get_altura_hexagono()
	var raio = Global.get_raio_hexagono()

	var x = pos_hex.x * (largura - (largura - raio) / 2.0)
	var y = pos_hex.y * altura_hex \
		- (pos_hex.x % 2) * (altura_hex / 2.0) \
		- altura * (altura_hex / 2.0)

	return Vector2(x, y)

	


func _ready() -> void:
	ajustar_posicao()


func _process(delta: float) -> void:
	ajustar_posicao()
		
func ajustar_posicao():
	pai = get_parent()
	
	pai.position = hexagono_para_quadrado(posicao_hexagonal)
	
	if pai.has_method("passar_dados"):
		var dados = pai.passar_dados()
		posicao_hexagonal = dados.get("posicao_hex", Vector2i(0,0))
