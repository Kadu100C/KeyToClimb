extends CharacterBody2D
class_name Character

@export var base_status: Status
@export var alcance_coleta: float = 300
@onready var sprite = $AnimatedSprite2D
@export var current_status = base_status
#add ds
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		coletar_item_direcional()
		
func coletar_item_direcional():
	var item_coletado = null
	var lado = ""
	var direita = position + Vector2(alcance_coleta, 0)
	var esquerda = position + Vector2(-alcance_coleta, 0)

	for corpo in get_tree().get_nodes_in_group("itens"):
		if corpo is Area2D and corpo.global_position.distance_to(direita) < 300:
			item_coletado = corpo
			lado = "direita"
			break
		elif corpo is Area2D and corpo.global_position.distance_to(esquerda) < 300:
			item_coletado = corpo
			lado = "esquerda"
			break

	#if item_coletado:
	#	# Toca animação
	#	sprite.play("coletar_" + lado)

		# zoma os status
	if item_coletado.has_variable("bonus_status"):
		current_status.add(item_coletado.bonus_status)
		item_coletado.queue_free()
	else:
		print("Nenhum item próximo!")

# func _ready():
