extends Node2D


func _draw() -> void:
	var camera := get_viewport().get_camera_2d()
	if camera == null:
		print("num tem camera")
		return
	var zoom := camera.zoom
	var tamanho_tela = camera.get_viewport_rect().size
	var tamanho_tela_com_zoom = tamanho_tela / zoom
	
	var rectangulo = Rect2(Vector2.ZERO, tamanho_tela_com_zoom)
	draw_rect(rectangulo, Color(0.11, 0.02, 0.086))
	
	


func _on_camera_2d_zoom_alterado(novo_zoom: Vector2) -> void:
	queue_redraw()
