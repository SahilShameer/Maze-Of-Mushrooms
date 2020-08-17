extends Button


func _on_button_up():
	GameData.score = 0
	GameData.health = 0
	GameData.key = 0
	get_tree().paused = false
	get_tree().reload_current_scene()
	
