extends CharacterBody2D
class_name BossStrength

@export var base_status: Status
var current_status: Status
var vida_atual: int

func _ready():
	current_status = base_status.copy()
	vida_atual = current_status.health
