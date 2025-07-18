extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	if global.start:
		$AnimatedSprite2D.play("eclate")
		global.numberofbaloon -= 1

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
