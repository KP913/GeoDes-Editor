extends Camera2D

var is_panning = false

func _input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			is_panning = true
		if !event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			is_panning = false
	
	if is_panning && event is InputEventMouseMotion:
		var vector = event.relative
		position -= vector
