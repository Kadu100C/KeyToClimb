extends Area2D
class_name Sword

@export var nome: String
@export var bonus_status: Status

func _ready():
	add_to_group("itens")
