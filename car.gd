extends Area2D

var direction = Vector2.LEFT
var speed = 2

func _process(delta: float) -> void:
	position += direction * speed


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
