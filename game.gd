extends Node2D

var car_scene: PackedScene = preload("res://car.tscn")

func _on_finish_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	print("has entered")


func _on_car_timer_timeout() -> void:
	#whenever triggered, attach instance of car scene
	#and add to game
	var car = car_scene.instantiate() as Area2D
	$Objects.add_child(car)
	var pos_marker = $CarStartPositions.get_children().pick_random() as Marker2D
	car.position = pos_marker.position
	car.connect("body_entered", go_to_title)

func go_to_title(body):
	print('player car collision')
