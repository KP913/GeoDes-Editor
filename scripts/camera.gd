extends Camera2D

var is_panning = false
var is_scalling = false
var grid_scale
@onready var main = find_parent("Main")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid_scale = main.grid_scaling_factor
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	var limite_posicao := 40.1
	var scale_factor := Vector2(0.05, 0.05)
	if event is InputEventMouseButton:
		if event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			is_panning = true
		if !event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			is_panning = false
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			zoom -= scale_factor
			print(zoom)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			zoom += scale_factor
			print(zoom)
		

	if is_panning && event is InputEventMouseMotion:
		var vector = event.relative
		position -= vector
		position = position.clamp(Vector2(-limite_posicao*grid_scale, -limite_posicao*grid_scale), Vector2((limite_posicao+1)*grid_scale, (limite_posicao+1)*grid_scale))
	
