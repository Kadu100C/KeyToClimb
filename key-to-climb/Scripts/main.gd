extends Node2D

const cam_start_pos := Vector2i(400, 300)

#Esses 3 aq são pra antes do timer, n sei como vc vai fazer o timer entao limitei assim só pra ele nao subir infinito
var time_up: float = 0.0
var limit_time: float = 60.0 #tempo em segundos :p
var subir: bool = true
# --

func _ready():
	new_game()

func new_game():
	$Camera2D.position = cam_start_pos
	$Tower/Player.position = cam_start_pos

func _process(delta):
	#esse if tb faz parte do temporario la
	if subir:
		time_up += delta
		#os que são obrigatório é os 2 verdinho
		$Tower/Player.position.y -= 4
		$Camera2D.position.y -= 4
		#aqui viu
		#esse de baixo tb sao temporarios
		if time_up >= limit_time:
			subir = false
