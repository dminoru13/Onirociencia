@tool
class_name PainelRoupas
extends MarginContainer

@export var lbl_nome: LineEdit
@export var btn_criar: EscolhedorArquivo
@export var base: VBoxContainer
@export var lista_botoes: Array[Button]
@export var conteiner_tipo_modelo: VBoxContainer
@export var seletor_tipos: SeletorTipos



var caminho_pasta: String = ""


var roupa_alvo: Roupa:
	set(v):
		roupa_alvo = v
		iniciar()

func _ready() -> void:
	base.visible = false



func _on_lbl_nome_text_changed(new_text: String) -> void:
	if lbl_nome.text != "":
		btn_criar.disabled = false
	else:
		btn_criar.disabled = true
func _on_btn_criar_arquivo_pego(arquivo: String) -> void:
	var nova_roupa = Roupa.new()
	nova_roupa.nome = lbl_nome.text
	roupa_alvo = nova_roupa
	caminho_pasta = arquivo
func _on_carregar_arquivo_pego(arquivo: String) -> void:
	roupa_alvo = load(arquivo)
func _on_btn_limpar_pressed() -> void:
	roupa_alvo = null
func _on_btn_salvar_pressed() -> void:
	atualizar()
	if caminho_pasta != "":
		ResourceSaver.save(roupa_alvo, caminho_pasta + "/" + lbl_nome.text +  ".tres")
	else:
		ResourceSaver.save(roupa_alvo, roupa_alvo.resource_path)
func _on_add_pressed() -> void:
	var cena: PackedScene = load("res://addons/EditorDeCriaturas/Modulos/moduloTipoArquivo/moduloTipoArquivo.tscn")
	var instancia: ModuloTipoArquivo = cena.instantiate()
	conteiner_tipo_modelo.add_child(instancia)


func iniciar():
	for filho in conteiner_tipo_modelo.get_children():
		filho.queue_free()
	
	if roupa_alvo == null:
		lbl_nome.text = ""
		base.visible = false
		lbl_nome.editable = true
		for botao in lista_botoes:
			botao.disabled = true
		if lbl_nome.text != "":
			btn_criar.disabled = false
	
	else:
		lbl_nome.text = roupa_alvo.nome
		base.visible = true
		lbl_nome.editable = false
		for botao in lista_botoes:
			botao.disabled = false
		btn_criar.disabled = true
		seletor_tipos.select(Global.lita_tipos_partes.find(roupa_alvo.tipo))
		
		for iten in roupa_alvo.dicionario_modelos:
			var cena: PackedScene = load("res://addons/EditorDeCriaturas/Modulos/moduloTipoArquivo/moduloTipoArquivo.tscn")
			var instancia: ModuloTipoArquivo = cena.instantiate()

			instancia.tipo = iten
			instancia.modelo = roupa_alvo.dicionario_modelos[iten]
			conteiner_tipo_modelo.add_child(instancia)

func atualizar():
	roupa_alvo.tipo = Global.lita_tipos_partes[seletor_tipos.selected]
	
	roupa_alvo.dicionario_modelos.clear()
	
	for filho: ModuloTipoArquivo in conteiner_tipo_modelo.get_children():
		roupa_alvo.dicionario_modelos[filho.tipo] = filho.modelo
	
	print(roupa_alvo.dicionario_modelos)










#
