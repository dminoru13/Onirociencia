@tool
class_name Parte
extends Resource

@export var nome: String
@export var modelo: Modelo
@export var lista_parte: Array[Parte]
@export var tipo: String = "sem tipo atribuido"
@export var roupas: Dictionary[String,Roupa]:
	set(v):
		roupas = v
		propagar_roupas()

signal novas_roupas


func propagar_roupas():
	for filho: Parte in lista_parte:
		filho.roupas = roupas
	
	novas_roupas.emit()
