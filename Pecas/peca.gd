@tool
extends Node3D

@export_tool_button("limpar")
var matar_crianca = limpar

@export_tool_button("atualizar")
var atualizar = atualizar_modelo

@export_group("Partes")

#Torso
@export_subgroup("torso")

@export_file("*.tscn") var fonteTorso: String = "res://Pecas/Humanoide/Partes/Torso/torso_base.tscn":
	set(value):
		fonteTorso = value
		atualizar_modelo()

#Cabeca
@export_subgroup("cabeca")

@export var ArrayCabeca: Array


#BRACOS
@export_subgroup("braco")

@export var ArrayBracos: Array

#PERNAS
@export_subgroup("perna")

@export var ArrayPernas: Array






#FUNÇÔES
func _init() -> void:
	atualizar_modelo()




#limpa tudo
func limpar():
	limpar_ligth()
	ArrayBracos.clear()
	ArrayPernas.clear()
	ArrayCabeca.clear()
	notify_property_list_changed()
	
func limpar_ligth():
	for child in get_children():
		if child.name != "imutavel":
			child.queue_free()



#Atualizar modelo
func atualizar_modelo():
	
	limpar_ligth()
	
	#Carrega e cria o torso
	if fonteTorso != "":
		var cena = load(fonteTorso)
		
		if cena:
			var instancia = cena.instantiate()
			instancia.name = "Torso"
			add_child(instancia)
	
	
	#Coloca o numero de marcadres de braço como a quantidade da array bracos
	
	if get_node_or_null("Torso") != null:
		var objeto = get_node_or_null("Torso")
		
		contarMembros("Cabeca", objeto, ArrayCabeca)
		contarMembros("Braco", objeto, ArrayBracos)
		contarMembros("Perna", objeto, ArrayPernas)


func contarMembros(comeco_do_nome: String, objeto_alvo, array_alvo: Array):
	var numero_ate_agora: int = 0
	var array_de_cordenadas: Array = []
	var quantidade_atual := array_alvo.size()
	
	for filho in objeto_alvo.get_children():
		var nome = filho.name
		
		if nome.begins_with(comeco_do_nome):
			numero_ate_agora += 1
			array_de_cordenadas.append(filho.position)

	if quantidade_atual != numero_ate_agora:
		ajustar_arrays(array_alvo, numero_ate_agora)
	
	criar_modelos(array_alvo, array_de_cordenadas)


#AJUSTAR ARRAY
func ajustar_arrays(arrayAlvo: Array, quantidade: int):
	
	if arrayAlvo.size() != quantidade:
		arrayAlvo.resize(quantidade)
	
		for i in range(arrayAlvo.size()):
			if arrayAlvo[i] == null:
				arrayAlvo[i] = RecursoCorpo.new()
		
	notify_property_list_changed()


func criar_modelos(array_alvo: Array, array_cordenadas: Array):
	for i in range(array_alvo.size()):
		if array_alvo[i] != null:
			
			if array_alvo[i].modelo != null:
				var instancia_crua = array_alvo[i].modelo
				var instancia = instancia_crua.instantiate()
				add_child(instancia)
				instancia.position = array_cordenadas[i]
				
				#roda 180 graus o braco marcado como invertido
				if array_alvo[i].espelhado == true:
					instancia.rotate_z(deg_to_rad(180))
