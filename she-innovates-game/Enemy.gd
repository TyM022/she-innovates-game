extends CharacterBody2D

@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar
@onready var area_2d: Area2D = $Area2D

func _ready() -> void:
	connect_signals()

func connect_signals() -> void:
	area_2d.connect("body_entered", decrease_life_points)
	texture_progress_bar.connect("value_changed", healthbar_changed)

func decrease_life_points(body : Node2D) -> void:
	if body is Bullet:
		texture_progress_bar.value -= 1
		body.queue_free()

func healthbar_changed(value : float) -> void:
	if value == 0:
		queue_free()
