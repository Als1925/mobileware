extends Node2D

@export var temps : int = 10
@onready var label: Label = $Label

var a_commencé := false  # Pour éviter de démarrer plusieurs fois

func _ready() -> void:
	label.text = str(temps)

func _process(delta: float) -> void:
	if global.start and not a_commencé:
		a_commencé = true
		start_timer()

func start_timer() -> void:
	await_timer()

func await_timer() -> void:
	await get_tree().create_timer(1.0).timeout
	if temps > 0:
		temps -= 1
		label.text = str(temps)
		start_timer()
	else:
		label.text = "0"
		get_tree().change_scene_to_file("res://scenes/cut_scene.tscn")
