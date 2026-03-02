@tool
extends Node3D

@export_tool_button("limpar")
var matar_crianca = limpar

func limpar():
	limpar_ligth()
	ArrayBracos.clear()
	notify_property_list_changed()
	
func limpar_ligth():
	for child in get_children():
		if child.name != "imutavel":
			child.queue_free()
	quantidade_bracos = 0


@export_tool_button("atualizar")
var atualizar = atualizar_modelo

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
	
	var cordenadas_braco: Array = []
	cordenadas_braco.clear()
	
	var cordenadas_perna: Array = []
	cordenadas_braco.clear()
	
	if get_node_or_null("Torso") != null:
		var objeto = get_node_or_null("Torso")
		
		var bracos_ate_agora = 0
		var bpernas_ate_agora = 0
		#PROGRAMAR PERNAS
		
		for filho in objeto.get_children():
			var nome = filho.name
			
			if nome.begins_with("Braco"):
				bracos_ate_agora += 1
				cordenadas_braco.append(filho.position)
		
		if quantidade_bracos != bracos_ate_agora:
			quantidade_bracos = bracos_ate_agora
		
		ajustar_array_braco()
			
			
	
	#cria os bracos
	
	for i in range(ArrayBracos.size()):
		if ArrayBracos[i] != null:
			
			if ArrayBracos[i].modelo != null:
				var instancia_crua = ArrayBracos[i].modelo
				var instancia = instancia_crua.instantiate()
				add_child(instancia)
				instancia.position = cordenadas_braco[i]
				
				#roda 180 graus o braco marcado como invertido
				if ArrayBracos[i].espelhado == true:
					instancia.rotate_z(deg_to_rad(180))
				
				#coloca im marker como alvo do braço
				if str(ArrayBracos[i].alvo) != "":
					instancia.Alvo = get_node(ArrayBracos[i].alvo) as Marker3D
		pass
	
	pass







@export_group("Partes")

@export_subgroup("torso")

@export_file("*.tscn") var fonteTorso: String = "res://Pecas/Humanoide/Partes/Torso/":
	set(value):
		fonteTorso = value
		atualizar_modelo()

var quantidade_bracos: int = 0

@export_subgroup("braco")

@export var ArrayBracos: Array[ArrayDeMembros]

func ajustar_array_braco():
	if ArrayBracos.size() != quantidade_bracos:
		ArrayBracos.resize(quantidade_bracos)
	
		for i in range(ArrayBracos.size()):
			if ArrayBracos[i] == null:
				ArrayBracos[i] = ArrayDeMembros.new()
		
	notify_property_list_changed()


@export_subgroup("perna")

@export var ArrayPerna: Array[ArrayDeMembros]

var quantidade_pernas: int = 0

func ajustar_array_perna():
	if ArrayPerna.size() != quantidade_pernas:
		ArrayPerna.resize(quantidade_pernas)
	
		for i in range(ArrayPerna.size()):
			if ArrayPerna[i] == null:
				ArrayPerna[i] = ArrayDeMembros.new()
		
	notify_property_list_changed()
