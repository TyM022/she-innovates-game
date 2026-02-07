extends CharacterBody2D

@export var speed : int = 100
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	GlobalData.player = self

func _process(_delta: float) -> void: 
	get_input()
	update_animation()
	move_and_slide()

func get_input() -> void:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		for child in get_children():
			if child.has_method("shoot"):
				child.shoot()
				return

func update_animation() -> void:
	if velocity.x < 0 || velocity.y < 0 && velocity.x <= 0:
		animation_player.play("WalkLeft")
	elif velocity.x > 0 || velocity.y > 0 && velocity.x >= 0:
		animation_player.play("WalkRight")
	else:
		animation_player.play("Idle")
