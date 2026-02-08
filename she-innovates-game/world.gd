extends Node2D

@onready var gun: Node = $Player/Gun

# flag to make sure victory happens once
var levelDone = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemies = get_tree().get_nodes_in_group("enemies")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if levelDone:
		return
		
	var enemies = get_tree().get_nodes_in_group("enemies")
	if enemies.size() == 0:
		levelDone = true
		#TEST PRINTS
		print("Shots fired: ", gun.numShots)
		var leftover: float = $CanvasLayer/TextureProgressBar.get_value()
		print("Balance remaining: ", leftover)
		$CanvasLayer/CompletionMessage._victory(leftover)
