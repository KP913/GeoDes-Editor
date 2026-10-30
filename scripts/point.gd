extends Node2D

var coords := Vector3(0, 0, 0)
var text_offset_from_point
var grid_scaling_factor: int
@onready var main = find_parent("Main")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid_scaling_factor = main.grid_scaling_factor
	text_offset_from_point = main.text_offset_from_point
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	set_P1P2_position()
	set_P1P2_line()
	set_P1P2_label()
	
	if main.is_P3_visible:
		set_P3_position()
		set_P3_label()
		set_P2P3_line()
		set_P1P3_line()
		make_P3_visible()
	else:
		make_P3_invisible()

func set_P1P2_position ():
	$P1.position.x = -coords.x * grid_scaling_factor
	$P1.position.y = coords.y * grid_scaling_factor
	
	$P2.position.x = -coords.x * grid_scaling_factor
	$P2.position.y = -coords.z * grid_scaling_factor
	
func set_P1P2_line ():
	$LineP1P2.set_point_position(0, $P1.position) #godot function, not mine
	$LineP1P2.set_point_position(1, Vector2($P1.position.x, 0))
	$LineP1P2.set_point_position(2, $P2.position)
	
	#$LineP1P2.points[0] = $P1.position
	#$LineP1P2.points[1] = Vector2($P1.position.x, 0)
	#$LineP1P2.points[2] = $P2.position
	
func set_P1P2_label ():
	$LabelPoint1.text = name+"1"
	$LabelPoint1.position = $P1.position + text_offset_from_point
	$LabelPoint2.text = name+"2"
	$LabelPoint2.position = $P2.position + text_offset_from_point
	
func set_P3_position ():
	$P3.position.x = coords.y*grid_scaling_factor
	$P3.position.y = -coords.z*grid_scaling_factor
	
func set_P3_label ():
	$LabelPoint3.text = name+"3"
	$LabelPoint3.position = $P3.position + text_offset_from_point
	
func set_P2P3_line():
	$LineP2P3.set_point_position(0, $P2.position) #godot function, not mine
	$LineP2P3.set_point_position(1, Vector2(0, $P2.position.y))
	$LineP2P3.set_point_position(2, $P3.position)
	
	#$LineP2P3.points[0] = $P2.position
	#$LineP2P3.points[1] = Vector2(0, $P2.position.y)
	#$LineP2P3.points[2] = $P3.position

func set_P1P3_line ():
	var lista = []
	
	#Linha horizontal até ao eixo y
	lista.append($P1.position) 
	lista.append(Vector2(0, $P1.position.y))
	
	#Parte curva da linha
	var raio := coords.y * grid_scaling_factor
	for angle in range (-90, 0, 1):
		var point := Vector2(0, 0)
		point.x = raio*cos(deg_to_rad(angle))
		point.y = -raio*sin(deg_to_rad(angle))
		lista.append(point)
	
	#Linha vertical até P3
	lista.append(Vector2($P3.position.x,0))
	lista.append($P3.position)
	
	$LineP1P3.points = lista

func make_P3_visible ():
	$P3.visible = true
	$LabelPoint3.visible = true
	$LineP2P3.visible = true
	$LineP1P3.visible = true
	
func make_P3_invisible ():
	$P3.visible = false
	$LabelPoint3.visible = false
	$LineP2P3.visible = false
	$LineP1P3.visible = false
