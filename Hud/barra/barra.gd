@tool
class_name barra extends Control

@export var valor_maximo : int
@export var valor_atual : int

var tamanho_padrao_horizontal := 300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var pai = get_parent()

	if pai is Control:
		print("tenho pai legal")
	
	elif custom_minimum_size.x != tamanho_padrao_horizontal:
		custom_minimum_size = Vector2(tamanho_padrao_horizontal, custom_minimum_size.y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var texto := $Borda/Margem/Barra_interna/Texto
	texto.text = str(valor_maximo) + " / " + str(valor_atual)
	
	var barra_interna = $Borda/Margem/Barra_interna
	
	
