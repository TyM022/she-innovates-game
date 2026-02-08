extends Panel

@onready var leftoverAmt = $leftoverAmt

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide() # Replace with function body.

 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _victory(leftoverVal):
	leftoverAmt.text = "$" + str(leftoverVal).pad_decimals(2)
	show()
	
	# update debt tracker
	DebtAutoloader.finishLevel(leftoverVal)
	
func _on_button_pressed():
	get_tree().change_scene_to_file("res://world_select.tscn")
