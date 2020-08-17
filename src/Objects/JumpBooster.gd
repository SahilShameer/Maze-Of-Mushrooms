extends Area2D



func _on_body_entered(body):
	GameData.jump += 1
	GameData.dam += 1
