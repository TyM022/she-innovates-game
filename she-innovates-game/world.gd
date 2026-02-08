extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")
	 # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.size() == 0:
		var leftover: float = $CanvasLayer/TextureProgressBar._get_value()
		$CanvasLayer/CompletionMessage._victory(leftover)
