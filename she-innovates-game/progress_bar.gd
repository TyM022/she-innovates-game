extends TextureProgressBar

var startMoney = 200

@onready var player: Node = $"../../Player"
@onready var enemy: Node = $"../../Enemy"

@onready var gun: Node = $"../../Player/Gun"

# Called when the node enters the scene tree for the first time.
func _ready():
	max_value = startMoney
	value = startMoney
	gun.shotFired.connect(update)
	#enemy.moneySpent.connect(update)
	update() # update value whenever money is spent


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	# called everytime money spent changes
func update():
	# decrease money by 4$ for each enemy hit
	value = startMoney - (gun.numShots * 3)
	#if enemy:
		## reset enemy hit count for new levels?
		#enemy.hitCount = 0
	print("Shots: ", gun.numShots, " Value: ", value)
