extends Node2D

var games = ["eclate_les_ballons"]

func _ready() -> void:
	$"compte à rebours".text = "3"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "2"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "1"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "GO"
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://scenes/" + games.pick_random() + ".tscn")
