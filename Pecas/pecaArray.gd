@tool
extends Node3D


@export_tool_button("Atualizar")
var botao_atualizar = atualizar 

@export_tool_button("Limpar")
var botao_limpar = limpar

@export_file("*.tscn") var fonte_torso: String = "res://Pecas/Humanoide/Partes/Torso/torso_base.tscn":
	set(value):
		fonte_torso = value
		atualizar()

@export var Membros: Dictionary[String, Array]
var dicionario_temporario:Dictionary[String, Array]

func juntar_Dicionarios():
	Membros = dicionario_temporario
	notify_property_list_changed()

func limpar():
	print("apagando membros existentes")
	dicionario_temporario.clear()
	juntar_Dicionarios()

func limpar_um_pouco():
	for grupo in dicionario_temporario:
		limpar_grupo(grupo)
 
func atualizar():
	print("atualizando")
	
	
	if fonte_torso != "":
		print("torso não é null")
		var cena_torso = load(fonte_torso)
		
		if cena_torso:
			print("torso existe")
			print("criando torso")
			var instancia = cena_torso.instantiate()
			instancia.name = "Torso"
			add_child(instancia)
			
			torso_criado(instancia)
		
		else:
			print("Torso Invalido")
		
	juntar_Dicionarios()


func torso_criado(torso):
	print("torso criado")
	for filho in torso.get_children():
		if filho.name != "Torso" :
			var nome: String = filho.name
			
			print("")
			print("criando ", nome)
			
			if ja_tem_esse(nome) == false:
				print("tentando criar gurpo: ", nome)
				var novo_grupo: Array = []
				
				dicionario_temporario[nome] = novo_grupo
				print("Grupo ", nome, " foi criado")
				
				adicionar_membro_a_grupo(descobrir_tipo(nome), nome)
			
			else:
				adicionar_membro_a_grupo(descobrir_tipo(nome), nome)
				
				
				
				
				notify_property_list_changed()
				




func ja_tem_esse(nome: String):
	var nome_sem_numero = descobrir_grupo(nome)
	var ja_exite = false
	
	print("Descobrindo se existe um grupo com o nome: ", nome_sem_numero)
	
	if dicionario_temporario.size() == 0:
		print("Nenhum grupo existe")
		return false
	
	else:
		for Grupo in dicionario_temporario:
			
			if Grupo == nome_sem_numero:
				print("Já existe um grupo com nome: ", nome_sem_numero)
				ja_exite = true
		
		if ja_exite == false:
			print("não existe um grupo com nome: ", nome_sem_numero)
		
		else:
			print("cancelando criação do grupo")
		
		return ja_exite


func descobrir_tipo(nome: String):
	var tipo
	
	print("descobrindo tipo do ", nome)
	
	if nome.begins_with("Braco"):
		tipo = RecursoBracos.new()
	
	else:
		tipo = RecursoCorpo.new()
	
	print("o tipo do ",nome, " é ", tipo)
	return tipo


func descobrir_grupo(nome: String):
	var regex = RegEx.new()
	regex.compile("\\d+$")
	return regex.sub(nome, "", true)


func adicionar_membro_a_grupo(membro, nome_do_grupo):
	for Grupo in dicionario_temporario:
		if Grupo == nome_do_grupo:
			dicionario_temporario[Grupo].append(membro)
			print("adicionando membro ao grupo: ", nome_do_grupo)

func limpar_grupo(nome_do_grupo):
	for Grupo in dicionario_temporario:
		dicionario_temporario[Grupo].clear()
