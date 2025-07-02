extends CanvasLayer



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/ficha_do_inimigo_1.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
