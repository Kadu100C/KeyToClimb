extends Button

@onready var pause_menu: CanvasLayer = $"../../pause_menu"

func _on_pressed() -> void:
		pause_menu.visible = true
		get_tree().paused = true
