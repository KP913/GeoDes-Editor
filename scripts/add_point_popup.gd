extends Control
var valid_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ",", "-"]
@onready var main = find_parent("Main")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_char(char: String):
	if char == "DEL":
		if $LineEdit.text.length() != 0:
			$LineEdit.text = $LineEdit.text.substr(0, $LineEdit.text.length() - 1)
	else:
		#if char == "-"
			#var text_temp = $LineEdit.text +char
			
		$LineEdit.text += char

func _on_line_edit_text_changed(new_text: String) -> void:
	for char in new_text:
		if char not in valid_chars:
			$LineEdit.text = new_text.remove_char(ord(char))

func close_popup() -> void:
	$LineEdit.text = ""
	hide()
	
func popupoppen() -> void:
	show()
	
func submit_text() -> void:
	var list = $LineEdit.text.split(",")
	if list.size() != 3:
		$LineEdit.text = ""
		$ErrorMessage.show()
		await get_tree().create_timer(5).timeout
		$ErrorMessage.hide()
		return
		
	var point = Vector3()
	point.x = int(list[0])
	point.y = int(list[1])
	point.z = int(list[2])
	
	main.points.append(point)
	main.add_point(point)
	close_popup()

func check_valid_minus(coords: String):
	var lista
	lista = coords.split(",")
	for coord in lista:
		for i in coord.length():
			if coord[i] == "-" and i != 0:
				return false
	return true
				
				
				
