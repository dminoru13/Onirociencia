@tool
extends Area2D
	
@export var espessura_linha:= 1:
	set(value):
		espessura_linha = value
		atualizar_vizual()
		
@export var cor_tile:= Color(0.247, 0.0, 0.867, 1.0):
	set(value):
		cor_tile = value
		atualizar_vizual()
	
@export var cor_borda:= Color(1.0, 1.0, 1.0, 0.1)

@export var cor_parede := Color.DARK_SLATE_GRAY

@onready var poly := $PoligonoHexagono
@onready var colisao := $CollisionPolygon2D
@onready var borda := $LinhaHexagono
@onready var parede := $PoligonoParede
@onready var borda_parede := $LinhaParede

var posicao_hex := Vector2i(0,0)
var altura := 0

func passar_dados():
	return {
		"altura": altura,
		"posicao_hex": posicao_hex
	}


func _ready() -> void:
	atualizar_vizual()


func _process(delta: float) -> void:
	pass
		
	


func atualizar_vizual():
	if not is_inside_tree():
		return
	if not poly or not borda or not colisao:
		return

	var pontos = criar_hecxagono()
	if pontos.size() < 6:
		return

	colisao.polygon = pontos
	poly.polygon = pontos
	poly.color = cor_tile

	borda.points = fechar_poligonos_ponto(pontos)
	borda.width = espessura_linha
	borda.default_color = cor_borda

	


func posicionar(pos_hex: Vector2i):
	posicao_hex = pos_hex

func fechar_poligonos_ponto(pontos: PackedVector2Array):
	var p = pontos.duplicate()
	p.append(pontos[0])
	return p


func criar_hecxagono() -> PackedVector2Array:
	var pontos := PackedVector2Array()
	
	
	for i in range(6):
		var angulo = deg_to_rad(60*i)
		var x = cos(angulo) * Global.get_raio_hexagono()
		var y = sin(angulo) * Global.get_raio_hexagono() * Global.achatamento
		pontos.append(Vector2(x, y))
	
	return pontos

func criar_parede():
	var topo := criar_hecxagono()
	var pontos := PackedVector2Array()
	
	var altura_muro = Global.altura_hexagono/2
	
	pontos.append(topo[0])
	pontos.append(topo[1])
	pontos.append(topo[2])
	pontos.append(topo[3])

	# projeção vertical (paredes)
	pontos.append(Vector2(topo[3].x, topo[3].y + altura_muro))
	pontos.append(Vector2(topo[2].x, topo[2].y + altura_muro))
	pontos.append(Vector2(topo[1].x, topo[1].y + altura_muro))
	pontos.append(Vector2(topo[0].x, topo[0].y + altura_muro))

	return pontos
