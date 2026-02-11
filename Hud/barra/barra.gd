@tool
class_name barra extends Control

@export var valor_atual : int = 1:
	set(value):
		valor_atual = clamp(value, 0, valor_maximo)
		atualizar_barra()

@export var valor_maximo : int = 1:
	set(value):
		valor_maximo = max(value, 1)
		
		if valor_atual > valor_maximo:
			valor_atual = valor_maximo
		
		
		atualizar_barra()


@export var tamanho_padrao := Vector2i(300, 20):
	set(value):
		tamanho_padrao = value
		atualizar_barra()


@export var cor := Color(255,0,0):
	set(value):
		cor = value
		atualizar_barra()


func _ready() -> void:
	atualizar_barra()



func _notification(what: int) -> void:
	if what == NOTIFICATION_RESIZED:
		atualizar_barra()
		print("mudo o tamanho eu juro")


func atualizar_barra():
	
	if not is_inside_tree():
		return
	
	
	#TEXTO
	var texto := get_node_or_null("Borda/Texto") 
	
	if texto:
		texto.text = str(valor_atual) + " / " + str(valor_maximo)
	
	
	
	#POSICAO
	var margem := 4
	var barra_interna := $Borda/Barra_interna

	if barra_interna.position != Vector2(barra_interna.get_parent().position.x +margem, barra_interna.get_parent().position.y +margem):
		barra_interna.position = Vector2(barra_interna.get_parent().position.x +margem, barra_interna.get_parent().position.y +margem)

	
	#TAMANHOS
	var porcentagem : = (float((valor_atual)) / float(max(valor_maximo,1)))
	
	var pai = get_parent()
	
	if pai is Control:
		barra_interna.size = Vector2((size.x - margem*2) * porcentagem, (size.y - margem*2))
		print("meu pai é um Control")
		
		barra_interna.custom_minimum_size = Vector2.ZERO
		barra_interna.custom_minimum_size = Vector2.ZERO
	
	else:
		size = tamanho_padrao
		barra_interna.size = Vector2((size.x - margem*2) * porcentagem, (size.y - margem*2 +1))
		
		custom_minimum_size.y = size.y
		barra_interna.custom_minimum_size.y = size.y - margem*2 +1
	
	#COR
	
	barra_interna.color = cor
	
	
	
