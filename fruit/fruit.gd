class_name Fruit extends RigidBody3D

@export var data: FruitData

@onready var mesh := $MeshInstance3D

func _ready():
	apply_fruit_data()
	
func apply_fruit_data():
	if data == null:
		return
		
	scale = Vector3.ONE * data.size_scale

	var material := StandardMaterial3D.new()
	material.albedo_color = data.color
	mesh.material_override = material
	
	
