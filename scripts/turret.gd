extends Node3D

@export var projectile: PackedScene
var enemy_path: Path3D
var target: PathFollow3D
@onready var turret_barrel: MeshInstance3D = $TurretBase/TurretTop/TurretBarrel

func destroy():
	queue_free()
	
func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target:
		look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target:
		var shot = projectile.instantiate()
		add_child(shot)
		shot.global_position = turret_barrel.global_position
		shot.direction = global_transform.basis.z
	
func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0
	for enemy in enemy_path.get_children():
		if enemy is PathFollow3D:
			if enemy.progress > best_progress:
				best_target = enemy
				best_progress = enemy.progress
	return best_target
