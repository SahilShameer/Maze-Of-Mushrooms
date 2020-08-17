extends Area2D



func _on_area_entered(area):
	GameData.key += 1
	GameData.dam += 1 
	$pickup.play()
	$AnimationPlayer.play("fade")
