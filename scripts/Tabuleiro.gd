@tool
extends Node2D

@export var tamanho_tabuleiro := Vector2i(0,0)
@export var CenaTile: PackedScene


func _ready() -> void:

	
	for x in range(tamanho_tabuleiro.x):
		for y in range(tamanho_tabuleiro.y):
			var tile := CenaTile.instantiate()
			add_child(tile)
			tile.posicionar(Vector2i(x,y))



func _process(delta: float) -> void:
	pass
