extends Node2D

var temps = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(temps.pick_random()).timeout
	$AnimationPlayer.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	if global.start:
		$AnimationPlayer.play("RESET")
		$AnimatedSprite2D.play("eclate")
		global.numberofbaloon -= 1

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
