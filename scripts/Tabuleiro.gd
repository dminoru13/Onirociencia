@tool
extends Node2D
@export var CenaTile: PackedScene


@export var tamanho_tabuleiro := Vector2i(0,0)
@export var cor_tabuleiro := Color(0.216, 0.204, 0.38, 1.0)




func _ready() -> void:
	
	var cores = [
		cor_tabuleiro.lightened(0.1),
		cor_tabuleiro,
		cor_tabuleiro.darkened(0.1)
	]
	
	
	for x in range(tamanho_tabuleiro.x):
		for y in range(tamanho_tabuleiro.y):
			var tile := CenaTile.instantiate()
			add_child(tile)
			tile.posicionar(Vector2i(x,y))
			tile.cor_tile = cores.pick_random()


	




func _process(delta: float) -> void:
	pass
