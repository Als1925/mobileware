extends Node2D

func _ready() -> void:
	$"compte à rebours".text = "3"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "2"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "1"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "GO"
