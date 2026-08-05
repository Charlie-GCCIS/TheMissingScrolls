extends CharacterBody2D

@export var move_speed: float = 100
var is_dashing: bool = false
var dash_timer = Timer.new()


func _ready() -> void:
	var score: int = 200
	var money: float = 15.5
	var username: String = "Charlie"
	var is_player_alive: bool = true
	
	dash_timer.autostart = true
	dash_timer.connect("timeout", _on_dash_timeout)
	
	

func _process(delta: float) -> void:
	
	if (Input.is_action_just_pressed("Dash")) :
		start_dash()
		
		
	print(dash_timer.time_left)
	# input changes velocity (not position cause collisions have issues or something like that)
	var movement_vector: Vector2 = Input.get_vector("Movement_Left", "Movement_Right", "Movement_Up", "Movement_Down")
	velocity = movement_vector * move_speed
	
	# up and down animations
	if (velocity.y < 0):
		$AnimatedSprite2D.play("Walk_Up")
	elif (velocity.y > 0):
		$AnimatedSprite2D.play("Walk_Down")
	
	# left and right animations
	elif (velocity.x > 0):
		$AnimatedSprite2D.play("Walk_Right")
	elif (velocity.x < 0):
		$AnimatedSprite2D.play("Walk_Left")
		
	
		
	# stop animations
	else:
		$AnimatedSprite2D.stop()
	move_and_slide()

func start_dash():
	dash_timer.start(1)
	is_dashing = true
	move_speed = 200
		
func _on_dash_timeout():
	is_dashing = false
	move_speed = 100
	print("Stop dash")
