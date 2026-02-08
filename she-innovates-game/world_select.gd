extends Control

@onready var worlds: Array = [$"World Icon", $"World Icon2", $"World Icon3"]
var current_world: int = 0

# for debt tracker
@onready var debtTracker = $CanvasLayer/DebtTracker/Panel2/amountLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	# update debt amount wheneber it loads
	debtTracker.text = "$" + str(DebtAutoloader.curDebt)
	
	$playerIcon.global_position = worlds[current_world].global_position
	
func _input(event):
	if event.is_action_pressed("ui_left") and current_world > 0:
		current_world -= 1
		$playerIcon.global_position = worlds[current_world].global_position
	if event.is_action_pressed("ui_right") and current_world < worlds.size() - 1:
		current_world += 1
		$playerIcon.global_position = worlds[current_world].global_position
	if event.is_action_pressed("ui_accept"):
		if worlds[current_world].level_select_scene:
			get_tree().get_root().add_child(worlds[current_world].level_select_scene)
			get_tree().current_scene = worlds[current_world].level_select_scene
			get_tree().get_root().remove_child(self)
