extends CharacterBody2D
class_name Player

@export var move_speed: float = 100
var is_dashing: bool = false
var dash_timer = Timer.new()


func _ready() -> void:
	var score: int = 200
	var money: float = 15.5
	var username: String = "Charlie"
	var is_player_alive: bool = true
	
	

func _process(delta: float) -> void:
	
	# input changes velocity (not position cause collisions have issues or something like that)
	var movement_vector: Vector2 = Input.get_vector("Movement_Left", "Movement_Right", "Movement_Up", "Movement_Down")
	velocity = movement_vector * move_speed
	
	# left and right animations
	if (velocity.x > 0):
		$AnimatedSprite2D.play("Walk_Right")
	elif (velocity.x < 0):
		$AnimatedSprite2D.play("Walk_Left")
	
	# up and down animations
	elif (velocity.y < 0):
		$AnimatedSprite2D.play("Walk_Up")
	elif (velocity.y > 0):
		$AnimatedSprite2D.play("Walk_Down")
	
	
	
		
	
		
	# stop animations
	else:
		$AnimatedSprite2D.stop()
	move_and_slide()
