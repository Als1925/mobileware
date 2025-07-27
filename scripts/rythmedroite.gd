extends Node2D

func _physics_process(delta: float) -> void:
	if global.destructrightrythme and global.start:
		global.destructrightrythme = false
		global.numberofrythme -= 1
		queue_free()


func _ready() -> void:
	$AnimationPlayer.play("tombe")
