extends Area2D



func _on_area_entered(area):
	GameData.dam +=1
	GameData.health = 0
	$AnimationPlayer.play("fade")
