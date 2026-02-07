extends Node

var world = null
var player = null

func _ready() -> void:
	call_deferred("find_player")

func find_player() -> void:
	var root = get_tree().root
	world = get_tree().current_scene
	
	if world and world.has_node("Player"):
		player = world.get_node("Player")

func _process(_delta: float) -> void:
	if not world or not is_instance_valid(world):
		world = get_tree().current_scene
	
	if not player or not is_instance_valid(player):
		if world and world.has_node("Player"):
			player = world.get_node("Player")
