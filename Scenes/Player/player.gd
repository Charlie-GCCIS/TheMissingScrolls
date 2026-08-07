extends CharacterBody2D
class_name Player

@export var move_speed: float = 100
@export var pushStrength: int = 10

# collision variable
var collision: KinematicCollision2D

func _ready() -> void:
	if SceneManager.playerSpawnPosition != Vector2(0,0):
		position = SceneManager.playerSpawnPosition
	Engine.max_fps = 60
	

func _physics_process(delta: float) -> void:
	
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
	
	# get last collision
	#check if its the block
	# if it is the block, push it
	
	collision = get_last_slide_collision()
	if collision:
		var collisionNode = collision.get_collider()
		
		if (collisionNode.is_in_group("Pushable")):
			var collisionNormal: Vector2 = collision.get_normal()
			
			collisionNode.apply_central_force(-collisionNormal * pushStrength)
			#print(collision.get_collider().name)
	
		
	
		
	# stop animations
	else:
		$AnimatedSprite2D.stop()
	move_and_slide()
