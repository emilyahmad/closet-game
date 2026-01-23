extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("STAR HIT:", body.name, body)
	call_deferred("win_screen")
	
	#if body.name == "Player":
		#print("STAR HIT:", body.name, body)
		#call_deferred("win_screen")

func win_screen():
	get_tree().change_scene_to_file("res://End.tscn")
