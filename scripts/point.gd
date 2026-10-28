extends Node2D

var coords := Vector3(3, 3, 3)
var text_offset_from_point := Vector2(10, -24)
var grid_scaling_factor: int
@onready var main = find_parent("Main")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grid_scaling_factor = main.grid_scaling_factor
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$P1.position.x = -coords.x * grid_scaling_factor
	$P1.position.y = coords.y * grid_scaling_factor
	
	$P2.position.x = -coords.x * grid_scaling_factor
	$P2.position.y = -coords.z * grid_scaling_factor
	
	print("A posicao de P1 é:", $P1.position)
	$LineP1P2.points[0] = $P1.position
	print("O P[0] da linha é:", $LineP1P2.points[0])
	$LineP1P2.points[1] = Vector2($P1.position.x, 0)
	$LineP1P2.points[2] = $P2.position
	
	$LabelPoint1.text = name+"1"
	$LabelPoint1.position = $P1.position + text_offset_from_point
	$LabelPoint2.text = name+"2"
	$LabelPoint2.position = $P2.position + text_offset_from_point
	
	if main.is_P3_visible:
		$P3.visible = true
		$LabelPoint3.visible = true
		$LineP2P3.visible = true
		$LineP1P3.visible = true
		$P3.position.x = coords.y*grid_scaling_factor
		$P3.position.y = -coords.z*grid_scaling_factor
		
		$LabelPoint3.text = name+"3"
		$LabelPoint3.position = $P3.position + Vector2(10, -24)
		
		$LineP2P3.points[0] = $P2.position
		$LineP2P3.points[1] = Vector2(0, $P2.position.y)
		$LineP2P3.points[2] = $P3.position
		
		var lista = []
		lista.append($P1.position)
		lista.append(Vector2(0, $P1.position.y))
		var raio := coords.y*grid_scaling_factor
		for angle in range (-90, 0, 1):
			var point := Vector2(0, 0)
			point.x = raio*cos(deg_to_rad(angle))
			point.y = -raio*sin(deg_to_rad(angle))
			lista.append(point)
		lista.append(Vector2($P3.position.x,0))
		lista.append($P3.position)
		$LineP1P3.points = lista
