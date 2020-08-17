extends Node

signal score_update
signal health
signal key
signal dam
signal jump

var score = 0 setget set_score
var health = 0 setget set_health
var key = 0 setget is_key
var dam = 0 setget dam
var jump = 0 setget jump_boosted

func reset():
	score = 0
	health = 0
	dam = 0
	key = 0
	jump = 0

func set_score(value):
	score = value
	emit_signal("score_update")
	
func set_health(value):
	health = value
	emit_signal("health")
	
func is_key(value):
	key = value
	emit_signal("key")
	
	
func dam(value):
	dam = value
	emit_signal("dam")
	
func jump_boosted(value):
	jump = value
	emit_signal("jump")
	
	



