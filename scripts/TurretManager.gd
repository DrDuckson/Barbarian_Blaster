extends Node3D

@export var turret: PackedScene
var new_turret

func build_turret(turret_position: Vector3) -> void:
	new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = turret_position
	
func destroy_turret() -> void:
	new_turret.queue_free()
	pass
