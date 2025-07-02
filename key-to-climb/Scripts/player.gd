extends CharacterBody2D
class_name Character

@export var base_status: Status
@onready var sprite = $AnimatedSprite2D
@onready var itens_node = get_parent().get_node("ItemList") # os itens ficam aqui
@onready var character_animation: AnimatedSprite2D = $PlayerAnimation/CharacterAnimation
@onready var pick_item: AudioStreamPlayer = $PlayerAnimation/CharacterAnimation/pickItem


func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		var mais_proximo_esquerda: Node = null
		var mais_proximo_direita: Node = null
		var menor_dist_esquerda = INF
		var menor_dist_direita = INF

		for item in itens_node.get_children():
			if not "bonus_status" in item:
				continue

			var dist = item.global_position.distance_to(global_position)

			if item.global_position.x < global_position.x:
				if dist < menor_dist_esquerda:
					menor_dist_esquerda = dist
					mais_proximo_esquerda = item
			elif item.global_position.x > global_position.x:
				if dist < menor_dist_direita:
					menor_dist_direita = dist
					mais_proximo_direita = item

		# Decide qual pegar com base em quem tá mais perto dos dois
		if mais_proximo_esquerda and menor_dist_esquerda < menor_dist_direita:
			pegar_item(mais_proximo_esquerda, "pegar_esquerda")
			character_animation.play("Grab")
			pick_item.play()
			await get_tree().create_timer(1).timeout
			character_animation.play("Idle")
			
		elif mais_proximo_direita:
			character_animation.flip_h =  true
			pegar_item(mais_proximo_direita, "pegar_direita")
			character_animation.play("Grab")
			pick_item.play()
			await get_tree().create_timer(1).timeout
			character_animation.play("Idle")


func pegar_item(item: Node, anim: String):
	var item_status = item.bonus_status
	base_status.strength += item_status.strength
	base_status.health += item_status.health
	base_status.magic += item_status.magic
	print("Força",base_status.strength)
	print("Vida", base_status.health)
	print("Magica", base_status.magic)
	print("    ")
	item.queue_free()
