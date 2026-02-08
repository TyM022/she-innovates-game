extends Control
class_name LevelSelect

@onready var current_level: LevelIcon = $LevelIcon
var current_world: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$playerIcon.global_position = current_level.global_position
	
func _input(event):
	if event.is_action_pressed("ui_left") and current_level.next_level_left:
		current_level = current_level.next_level_left
		$playerIcon.global_position = current_level.global_position
	if event.is_action_pressed("ui_right") and current_level.next_level_right:
		current_level = current_level.next_level_right
		$playerIcon.global_position = current_level.global_position
	if event.is_action_pressed("ui_up") and current_level.next_level_up:
		current_level = current_level.next_level_up
		$playerIcon.global_position = current_level.global_position
	if event.is_action_pressed("ui_down") and current_level.next_level_down:
		current_level = current_level.next_level_down
		$playerIcon.global_position = current_level.global_position
	if event.is_action_pressed("ui_accept"):
		if current_level.next_scene_path:
			get_tree().get_root().add_child(current_level.level_select_scene)
			get_tree().current_scene = current_level.level_select_scene
			get_tree().get_root().remove_child(self)
	#		get_tree().change_scene_to_file("res://World.tscn")
