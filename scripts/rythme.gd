extends Node2D

var rythmedroite = load("res://scenes/rythmedroite.tscn") as PackedScene
var rythmegauche = load("res://scenes/rythmegauche.tscn") as PackedScene

var droiteok = false
var gaucheok = false
var detection = null


func _ready() -> void:
	global.numberofrythme = 7
	global.start = false
	$"compte à rebours".show()
	$Label.show()
	$"compte à rebours".text = "3"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "2"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "1"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".text = "GO"
	await get_tree().create_timer(1).timeout
	$"compte à rebours".hide()
	$Label.hide()
	global.start = true
	add_child(rythmedroite.instantiate())
	await get_tree().create_timer(0.5).timeout
	add_child(rythmedroite.instantiate())
	await get_tree().create_timer(1).timeout
	add_child(rythmegauche.instantiate())
	await get_tree().create_timer(0.5).timeout
	add_child(rythmegauche.instantiate())
	await get_tree().create_timer(0.6).timeout
	add_child(rythmedroite.instantiate())
	await get_tree().create_timer(0.6).timeout
	add_child(rythmegauche.instantiate())
	await get_tree().create_timer(0.6).timeout
	add_child(rythmedroite.instantiate())
	
func _physics_process(delta: float) -> void:
	if global.numberofrythme <= 0:
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/cut_scene.tscn")

func _on_droite_area_entered(area: Area2D) -> void:
	detection = str(area)
	
	droiteok = true
	

func _on_droite_area_exited(area: Area2D) -> void:
	
	droiteok = false

func _on_droitebouton_pressed() -> void:
	if droiteok:
		global.destructrightrythme = true
	else:
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/cut_scene.tscn")
		print("no")


func _on_gauche_area_entered(area: Area2D) -> void:
	gaucheok = true


func _on_gauche_area_exited(area: Area2D) -> void:
	gaucheok = false


func _on_gauchebouton_pressed() -> void:
	if gaucheok:
		global.destructleftrythme = true
	else:
		await get_tree().create_timer(0.5).timeout
		get_tree().change_scene_to_file("res://scenes/cut_scene.tscn")
		print("stop")
