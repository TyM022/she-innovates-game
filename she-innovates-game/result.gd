extends Control


# Called when the node enters the scene tree for the first time.
func _input(event):
	if event.is_action_pressed("ui_accept"):
				get_tree().change_scene_to_file("res://World.tscn")
