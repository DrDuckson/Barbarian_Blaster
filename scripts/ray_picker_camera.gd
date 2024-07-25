extends Camera3D

@export var gridmap: GridMap
@onready var ray_cast_3d: RayCast3D = $RayCast3D

func _process(delta: float) -> void:
	var mouse_position: Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100.0
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			if Input.is_action_just_pressed("Lclick"):
				change_cell_item(0, 3)
			if Input.is_action_just_pressed("Rclick"):
				change_cell_item(3, 0)
	else:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
				
func change_cell_item(current_cell, dest_cell) -> void:
	var collision_point = ray_cast_3d.get_collision_point()
	var cell = gridmap.local_to_map(collision_point)
	print(cell)
	if gridmap.get_cell_item(cell) == current_cell:
		gridmap.set_cell_item(cell, dest_cell)
