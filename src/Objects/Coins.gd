extends Area2D

onready var anim = $AnimationPlayer

export var score = 3

func _on_area_entered(area):
	picked()

	
	
	
func picked():
	GameData.score += 1
	GameData.dam += 1
	$pickup.play()
	anim.play("FadeOut")






