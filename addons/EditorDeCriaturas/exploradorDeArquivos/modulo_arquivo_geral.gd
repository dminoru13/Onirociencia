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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print("um modulo de arquivo nasceu")
	
	if label_nome:
		if texto_label != label_nome.text:
			texto_label = label_nome.text
	
	if texto_label != texto_arquivo:
		label_nome.text = texto_arquivo
	
	
	if texture_rect:
		if e_uma_pasta:
			#print("------")
			#print("está merda é uma pasta")
			aplicar_textura("res://UI/icones/folder (1).png")
		
		if texture_rect.texture == null:
			#print("------")
			#print("TENANDO ATRIBUIR TEXTURA")
			if texto_arquivo.ends_with(".png"):
				#print("é um png")
				aplicar_textura(caminho_arquivo)
			elif texto_arquivo.ends_with(".tscn"):
				#print("é um tscn")
				aplicar_textura("res://UI/icones/clapperboard.png")
			elif texto_arquivo.ends_with(".gd"):
				#print("é um gd")
				aplicar_textura("res://UI/icones/file-cog.png")
			elif texto_arquivo.ends_with(".import"):
				#print("é um import")
				aplicar_textura("res://UI/icones/import.png")
			else:
				#print("não sei que merda é essa")
				aplicar_textura("res://UI/icones/file-question-mark.png")
		else:
			pass
			#print("o texture rect não existe")


signal apertou(nome, pasta)

func _on_pressed() -> void:
	##print("")
	#print("ME APERTARAM AQUI")
	#print("emitindo sinal APERTOU com o parametro: ", label_nome.text," pasta: ", e_uma_pasta)
	emit_signal("apertou", label_nome.text, e_uma_pasta)

func aplicar_textura(caminho):
	#print("twxturizando")
	texture_rect.texture = null
	if caminho_arquivo != "":
		#print(caminho_arquivo)
		texture_rect.texture = load(caminho)
