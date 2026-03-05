@tool
extends FoldableContainer

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass



func _on_suicidio_pressed() -> void:
	queue_free()
	print(title, " se matou")
