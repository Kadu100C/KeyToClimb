extends Node2D
@onready var boss = $demon2
@onready var jogador = $player_battle
@onready var phealth_bar = $player_battle/PlayerHealthBar
@onready var bhealth_bar = $demon2/BossHealthBar
@onready var damage_taken: AudioStreamPlayer = $dmg

func _ready():
	var status_jogador = jogador.base_status
	var status_boss = boss.base_status

	var dano_jogador = (status_jogador.magic * 2 + status_jogador.strength * 0.5)
	var dano_boss = max(status_boss.strength, 1)


	ataque_automatico(status_jogador.health, status_boss.health, dano_jogador, dano_boss)

func ataque_automatico(vida_jogador, vida_boss, dano_jogador, dano_boss):
	await get_tree().create_timer(0.5).timeout

	vida_boss -= dano_jogador
	boss.play("damage_demon")
	jogador.play("player attack")
	damage_taken.play()
	bhealth_bar.value = vida_boss

	await get_tree().create_timer(1).timeout
	boss.play("Idle")

	if vida_boss <= 0:
		print("Boss morreu");
		get_tree().change_scene_to_file("res://Scenes/victory.tscn")
		return

	vida_jogador -= dano_boss

	boss.play("attack_demon")
	jogador.play("player_damage")
	damage_taken.play()
	phealth_bar.value = vida_jogador

	await get_tree().create_timer(0.5).timeout
	jogador.play("idle_battle")
	boss.play("Idle")
	if vida_jogador <= 0:
		print("Player morreu")
		get_tree().change_scene_to_file("res://Scenes/Game over.tscn")
		return

	ataque_automatico(vida_jogador, vida_boss, dano_jogador, dano_boss)
