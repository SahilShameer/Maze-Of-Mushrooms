extends KinematicBody2D

const ACCELERATION = 1024 *5
const MAX_SPEED = 128 *5
const FRICTION = 0.5
const AIR_RESISTENCE = 0.02
const GRAVITY = 900
const JUMP_FORCE =128*3
const JUMP_BOOST = 530


var motion = Vector2.ZERO
var not_enemys = 0


onready var sprite = $Player
onready var gun = $Player/Gun
onready var jump = $jump
onready var hurt = $hurt


func _ready():
	GameData.connect("dam",self,"not_enemy")
	GameData.connect("jump",self,"jump_booster")
	
func not_enemy():
	not_enemys = 1
	
func jump_booster():
	motion.y = -JUMP_BOOST

func _on_EnemyDetector_area_entered(area):
	if not_enemys != 1:
		#$AnimationPlayer.play("die")
		death()
	else:
		not_enemys = 0
	
	

func _physics_process(delta):
	var x_input = Input.get_action_strength("right") - Input.get_action_strength("left")
	if x_input != 0:
		motion.x = x_input * ACCELERATION * delta
		motion.x = clamp(motion.x , -MAX_SPEED , MAX_SPEED)
		 
		
		sprite.scale.x = 1 if x_input > 0 else -1
		
		$AnimationPlayer.play("Sprint")
	else:
		$AnimationPlayer.play("IDLE")
	
	
	motion.y += GRAVITY * delta
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x , 0 , FRICTION)
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMP_FORCE
			jump.play()
	else:
		$AnimationPlayer.play("Jump")
		if Input.is_action_just_released("jump") and motion.y < -JUMP_FORCE/2:
			motion.y = -JUMP_FORCE/2
			
			
		
		if x_input == 0 : 
			
			motion.x = lerp(motion.x , 0 , AIR_RESISTENCE)
			
			
		
	motion = move_and_slide(motion, Vector2.UP)
	
	
	var is_shooting = true
	if Input.is_action_just_pressed("attack"):
		$shoot.play()
		is_shooting = gun.shoot(sprite.scale.x)
	
	
func death():
	GameData.health += 1
	hurt.play()
	if GameData.health == 3:
		sprite.visible = false
	














