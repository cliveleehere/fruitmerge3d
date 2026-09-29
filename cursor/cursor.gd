extends Node3D

@export var plane_y := 4.0

@onready var camera: Camera3D = get_viewport().get_camera_3d()
func _process(_delta):
	var mouse_pos := get_viewport().get_mouse_position()

	var ray_origin := camera.project_ray_origin(mouse_pos)
	var ray_direction := camera.project_ray_normal(mouse_pos)

	if abs(ray_direction.y) > 0.001:
		var distance := (plane_y - ray_origin.y) / ray_direction.y
		var hit_point := ray_origin + ray_direction * distance
		
		hit_point.x = clampf(hit_point.x, -1, 1)
		hit_point.z = clampf(hit_point.z, -1, 1)

		global_position.x = hit_point.x
		global_position.z = hit_point.z
