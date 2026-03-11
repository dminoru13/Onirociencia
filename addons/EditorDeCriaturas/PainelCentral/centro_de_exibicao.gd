@tool
extends Control


@export var painel_lateral: PainelLateral
@export var sub_viewport: SubViewport
@export var modelo_peca: ModeloPeca
@export var label_torso: Label

var novo_recurso: RecursoPeca = RecursoPeca.new()


#FUNÇÕES

#funções meramente auxiliares
func removedor_de_numeros(texto: String):
	var regex = RegEx.new()
	regex.compile("[0-9]")
	var resultado = regex.sub(texto, "", true)
	var separar = resultado.split("_")
	var nome_final = separar[0]
	return nome_final


#Funções principais

#atribui o novo recurso ao modelo
func atualizar():
	modelo_peca.recurso = novo_recurso


#arquivo vindo do torso
func _on_exibidor_de_arquivos_peguei_um_arquivo(arquivo: String, endereco: String) -> void:
	arquivo_recebido(arquivo, endereco)

#arquivo vindo do painel lateral
func _on_painel_lateral_arquivo_recebido(arquivo: String, endereco: String) -> void:
	arquivo_recebido(arquivo, endereco)

#Ativa ao receber um arquivo de qualquer lugar
func arquivo_recebido(arquivo: String, endereco: String):
	print("arquivo: ", arquivo, "   endereco: ", endereco)
	
	if endereco == "torso":
		print("")
		print("gerando novo recurso")
		novo_recurso.torso_base.caminho_modelo = arquivo
		print("novo torso atribuido")
		print("Caminho-torso: " , novo_recurso.torso_base.caminho_modelo)
		prencher_lista_partes(novo_recurso.torso_base)
		
		painel_lateral.atualizar_painel(novo_recurso.torso_base.lista_partes)
	
	else:
		for parte in novo_recurso.torso_base.lista_partes:
			if parte.nome == endereco:
				parte.caminho_modelo = arquivo
				print("Eu ", parte.nome, " recebi pelo correio um ", parte.caminho_modelo)
	
	atualizar()



#prenche a lista de partes do recurso
func prencher_lista_partes(parte_alvo: Parte):
	print("----")
	print("prenchendo lista partes")
	parte_alvo.lista_partes.clear()
	var modelo_cena: PackedScene = load(parte_alvo.caminho_modelo)
	var modelo_alvo: Node3D = modelo_cena.instantiate()
	print("lista partes: ")
	for filho in modelo_alvo.get_children():
		if filho is encaixePeca:
			var nova_parte: Parte = Parte.new()
			nova_parte.ancora = filho.position
			nova_parte.nome = filho.name
			parte_alvo.lista_partes.append(nova_parte)
			nova_parte.tipo = removedor_de_numeros(filho.name)
			print("tipo: ", nova_parte.tipo, " ancora: ", nova_parte.ancora)












#
