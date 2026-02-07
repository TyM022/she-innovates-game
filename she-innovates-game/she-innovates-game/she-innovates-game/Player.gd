extends CharacterBody2D

@export var speed : int = 100
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _process(delta: float) -> void: 
	get_input()
	update_animation()
	move_and_slide()
	

func get_input() -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity  = input_direction * speed

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("mouse_left"):
		get_node("Gun").shoot()

func update_animation() -> void:
	if velocity.x < 0 || velocity.y < 0 && velocity.x <= 0:
		animation_player.play("WalkLeft")
	elif velocity.x > 0 || velocity.y > 0 && velocity.x >= 0:
		animation_player.play("WalkRight")
	else:
		animation_player.play("Idle")
