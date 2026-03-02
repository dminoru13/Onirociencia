@tool
extends Node3D


var IK : CCDIK3D 

@export var Alvo: Marker3D:
	set(value):
		Alvo = value
		atualizar_ik()
		print(Alvo)


func _ready() -> void:
	atualizar_ik()



func atualizar_ik():
	IK = $Armature/Skeleton3D/ikBase
	print(IK)
	if Alvo and IK:
		IK.set_target_node(0, Alvo.get_path())
