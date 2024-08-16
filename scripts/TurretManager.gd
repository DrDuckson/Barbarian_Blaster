extends Node3D

@export var turret: PackedScene
@export var enemy_path: Path3D

var new_turret
#= preload("res://scenes/turret.tscn")

func build_turret(turret_position: Vector3) -> void:
	new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = turret_position
	new_turret.enemy_path = enemy_path
	
#func destroy_turret(turret_position: Vector3) -> void:
	#new_turret.destroy
