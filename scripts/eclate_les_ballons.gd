extends Node2D

var objet_scene = load("res://scenes/ballon_eclatable.tscn") as PackedScene
@export var marge_pixels: int = 100  # marge sur les bords de l’écran


func _ready():
	randomize()

	var viewport_rect = get_viewport_rect()
	var canvas_transform = get_canvas_transform()
	var inverse_transform = canvas_transform.affine_inverse()

	# Appliquer la marge aux coins
	var top_left = inverse_transform * Vector2(marge_pixels, marge_pixels)
	var bottom_right = inverse_transform * (viewport_rect.size - Vector2(marge_pixels, marge_pixels))

	for i in range(7):
		var instance = objet_scene.instantiate()

		# Position aléatoire dans les limites avec marge
		var random_x = randf_range(top_left.x, bottom_right.x)
		var random_y = randf_range(top_left.y, bottom_right.y)

		if instance is Node2D:
			instance.position = Vector2(random_x, random_y)
			instance.z_index = -1  # Pour être en arrière-plan

		add_child(instance)
	
	global.start = false
	global.numberofbaloon = 6
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if global.numberofbaloon == 0 and global.start:
		await get_tree().create_timer(1).timeout
		global.start = false
		get_tree().change_scene_to_file("res://scenes/cut_scene.tscn")
