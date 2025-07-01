extends Control

@onready var clock_timer: Timer = $clock_timer as Timer
@onready var counter_time: Label = $MarginContainer/VBoxContainer/counter_time as Label

var seconds = 0
@export_range(0,60) var default_seconds = 30

signal time_is_up()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	counter_time.text = str("%02d" % default_seconds)
	reset_clock_timer()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if seconds == 0:
		get_tree().change_scene_to_file("res://Scenes/boss_battle_1.tscn")


func _on_clock_timer_timeout() -> void:
	if seconds == 0:
		if seconds > 0:
			seconds
	seconds -= 1

	counter_time.text = str("%02d" % seconds)

func reset_clock_timer():
	seconds = default_seconds
