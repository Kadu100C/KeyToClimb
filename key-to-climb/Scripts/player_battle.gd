extends AnimatedSprite2D
@export var base_status: Status
@onready var health_bar = $PlayerHealthBar

var vida_atual = 0

func _ready():
	print(base_status.health)
	print(base_status.strength)
	print(base_status.magic)
	vida_atual = base_status.health
	health_bar.max_value = base_status.health
	health_bar.value = base_status.health
