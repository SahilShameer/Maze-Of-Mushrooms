extends Control

onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect = $PauseOverlay
onready var score:Label = $Label
onready var life1 = $Lifebar/TextureRect
onready var life2 = $Lifebar/TextureRect2
onready var life3 = $Lifebar/TextureRect3
onready var pause = $PauseOverlay/Title
onready var gameover = $Gameover

var paused = false setget set_pause

func _ready():
	GameData.connect("score_update",self,"update_interface")
	GameData.connect("health",self,"life_bar")
	update_interface()

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		self.paused = !paused
		scene_tree.set_input_as_handled()
		
		
func update_interface():
	score.text = "Score: %s" % GameData.score
	
	
func life_bar():
	if GameData.health == 1:
		life1.visible = false
	elif GameData.health == 2:
		life2.visible = false
	elif GameData.health == 3:
		life3.visible = false
		dead()
	elif GameData.health == 0:
		life1.visible  = true
		life2.visible  = true
		life3.visible = true
		

func set_pause(value:bool):
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
	
	
func dead():
	self.paused = true
	gameover.play()
	pause.text = "You Died"
	
