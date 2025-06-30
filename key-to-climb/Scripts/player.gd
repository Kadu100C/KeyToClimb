extends CharacterBody2D
class_name Character

@export var base_status: Status
var current_status: Status
var vida_atual: int

func _ready():
	current_status = base_status.copy()
	vida_atual = current_status.health

func apply_item(item_status: Status):
	current_status.add(item_status)
