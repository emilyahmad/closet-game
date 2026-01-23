extends Node2D

var car_scene: PackedScene = preload("res://car.tscn")
var score: int

func _on_finish_area_2d_body_entered(_body: Node2D) -> void:
	call_deferred("died_scene")

func died_scene():
	get_tree().change_scene_to_file("res://Died.tscn")

func start_scene():
	get_tree().change_scene_to_file("res://Title.tscn")

func _on_car_timer_timeout() -> void:
	var car = car_scene.instantiate() as Area2D
	$Objects.add_child(car)
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	car.connect("body_entered", go_to_title)

func go_to_title(_body):
	print(_body)
	print('player car collision')
	call_deferred("died_scene")

func _on_score_timer_timeout() -> void:
	score += 1
	$CanvasLayer/Label.text = str(score)
