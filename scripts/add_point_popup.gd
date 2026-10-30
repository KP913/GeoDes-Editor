extends Control
var name_separator
var error_message_showtime
var valid_names = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", 
"N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", name_separator]
@onready var main = find_parent("Main")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	error_message_showtime = main.error_message_showtime
	name_separator = main.name_separator
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func close_popup() -> void:
	clear_lines()
	hide()

func open_popup() -> void:
	show()
	
func submit_text() -> void:
	var coord1 = $LineEditX.text
	var coord2 = $LineEditY.text
	var coord3 = $LineEditZ.text
	var point_name = $LineEditName.text
	clear_lines()
	if not is_valid_coord(coord1) or not is_valid_coord(coord2) or not is_valid_coord(coord3):
		show_coords_error()
		return
	
	if not is_valid_name(point_name):
		show_name_error()
		return
	
	var point = Vector3(float(coord1), float(coord2), float(coord3))
	
	show_success_message(point)
	main.add_point(point, point_name)

func clear_lines():
	$LineEditX.text = ""
	$LineEditY.text = ""
	$LineEditZ.text = ""
	$LineEditName.text = ""

func is_valid_coord(coord: String):
	return coord.is_valid_float()
	
func is_valid_name(name: String):
	var i = 0
	for char in name:
		if char not in valid_names:
			return false
		if char != name_separator and i != 0:
			return false
		if char == name_separator and i == 0:
			return false
		i += 1
	for ponto in main.get_node("Pontos").get_children():
		if name == ponto.name:
			return false
	return true
	
func show_coords_error():
	$ErrorMessageCoords.show()
	await get_tree().create_timer(error_message_showtime).timeout
	$ErrorMessageCoords.hide()
	
func show_name_error():
	$ErrorMessageName.show()
	await get_tree().create_timer(error_message_showtime).timeout
	$ErrorMessageName.hide()
	
func show_success_message(point: Vector3):
	$SubmitMessage.text += str(point)
	$SubmitMessage.show()
	await get_tree().create_timer(error_message_showtime).timeout
	$SubmitMessage.hide()
	
	
	
	

	
