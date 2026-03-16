@tool
class_name  ModuloArquivo
extends Button

@export var texture_rect: TextureRect
@onready var label_nome: Label = $MarginContainer/VBoxContainer/ScrollContainer/Label_nome
var texto_label: String

@export_tool_button("aplicar textura")
var texturizar := aplicar_textura

@export var caminho_arquivo: String
@export var texto_arquivo: String
@export var e_uma_pasta:  bool

var selecionado: bool = false


func _ready() -> void:
	
	if label_nome:
		if texto_label != label_nome.text:
			texto_label = label_nome.text
	
	if texto_label != texto_arquivo:
		label_nome.text = texto_arquivo
	
	
	if texture_rect:
		if e_uma_pasta:
			aplicar_textura("res://UI/icones/folder (1).png")
		
		if texture_rect.texture == null:
			if texto_arquivo.ends_with(".png"):
				aplicar_textura(caminho_arquivo)
			elif texto_arquivo.ends_with(".tscn"):
				aplicar_textura("res://UI/icones/clapperboard.png")
			elif texto_arquivo.ends_with(".gd"):
				aplicar_textura("res://UI/icones/file-cog.png")
			elif texto_arquivo.ends_with(".import"):
				aplicar_textura("res://UI/icones/import.png")
			elif texto_arquivo.ends_with(".tres"):
				aplicar_textura("res://UI/icones/circle-dot.png")
			else:
				aplicar_textura("res://UI/icones/file-question-mark.png")
		else:
			pass


signal apertou(nome, pasta)

func aplicar_textura(caminho):
	texture_rect.texture = null
	if caminho_arquivo != "":
		texture_rect.texture = load(caminho)

func _on_pressed() -> void:
	if selecionado:
		emit_signal("apertou", label_nome.text, e_uma_pasta)
	
	else :
		selecionado = true
		
	await  get_tree().create_timer(0.7).timeout
	selecionado = false


		
