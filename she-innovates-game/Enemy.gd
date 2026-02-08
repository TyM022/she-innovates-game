extends CharacterBody2D

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var area_2d: Area2D = $Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var enemy_live : int = 3

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D
@export var movement_delta : float
@export var next_path_position : Vector2
@export var new_velocity : Vector2

## for progress bar
#@export var hitCount: int
#signal moneySpent

## for level completion signaling
signal enemyDefeat

func _ready() -> void:
	add_to_group("enemies")
	connect_signals()
	update_animation()

func _process(_delta: float) -> void: 
	move_enemy(_delta) 

func move_enemy(delta : float) -> void:
	if not GlobalData.player or not is_instance_valid(GlobalData.player):
		return
	
	navigation_agent_2d.set_target_position(GlobalData.player.get_global_position())
	if global_position.distance_to(GlobalData.player.get_global_position()) >= 16:
		movement_delta = 50 * delta
	else:
		movement_delta = 0
	next_path_position = navigation_agent_2d.get_next_path_position()
	new_velocity = global_position.direction_to(next_path_position) * movement_delta
	move_to_destination(new_velocity)
	
func move_to_destination(new_velocity : Vector2) -> void:
	global_position = global_position.move_toward(global_position + new_velocity, movement_delta)

func update_animation() -> void:
	if new_velocity.x < 0 || new_velocity.y < 0 && new_velocity.x <= 0:
		animation_player.play("WalkLeft")
	elif new_velocity.x > 0 || new_velocity.y > 0 && new_velocity.x >= 0:
		animation_player.play("WalkRight")
	else:
		animation_player.play("Idle")
	
func connect_signals() -> void:
	area_2d.connect("body_entered", decrease_life_points)
	texture_progress_bar.connect("value_changed", healthbar_changed)
	navigation_agent_2d.connect("velocity_computed", move_to_destination)
	

func decrease_life_points(body : Node2D) -> void:
	if body is Bullet:
		texture_progress_bar.value -= 1
		#hitCount += 1
		#moneySpent.emit()
		body.queue_free()

func healthbar_changed(value : float) -> void:
	if value == 0:
		
		# send signal for enemy defeat
		enemyDefeat.emit()
		
		queue_free()
