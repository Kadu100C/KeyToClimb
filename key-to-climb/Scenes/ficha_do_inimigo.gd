extends Node2D

@onready var textinho: Label = $textinho as Label
@onready var timer: Timer = $timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	textinho.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	textinho.visible = true


func _unhandled_input(event):
	if event.is_action_pressed("ui_select"):
		get_tree().change_scene_to_file("res://Scenes/tower.tscn")
