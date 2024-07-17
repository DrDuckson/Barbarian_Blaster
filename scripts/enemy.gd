extends PathFollow3D

@export var speed: float = 2.5
@onready var enemy: PathFollow3D = $"."
@onready var base = get_tree().get_first_node_in_group("grBase")

func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1.0:
		base.take_damage()
		set_process(false)
		enemy.queue_free()
		
