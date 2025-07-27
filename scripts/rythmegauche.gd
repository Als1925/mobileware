extends Node2D

func _physics_process(delta: float) -> void:
	if global.destructleftrythme and global.start:
		global.destructleftrythme = false
		global.numberofrythme -= 1
		queue_free()


func _ready() -> void:
	$AnimationPlayer.play("tombe")
