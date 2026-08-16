extends CharacterBody2D
class_name Player

@export var move_speed: float = 100
@export var pushStrength: int = 10

# collision variable
var collision: KinematicCollision2D

func _ready() -> void:
	UpdateTreasureLabel()
	if SceneManager.playerSpawnPosition != Vector2(0,0):
		position = SceneManager.playerSpawnPosition
	Engine.max_fps = 60
	

func _physics_process(delta: float) -> void:
	
	MovePlayer()
	
	MoveBlocks()
	
	UpdateTreasureLabel()
	
	move_and_slide()
	
##################################################################################
# Self made functions for moving player, pushing blocks, (more to come)
func MovePlayer():
	# input changes velocity (not position cause collisions have issues or something like that)
	var movement_vector: Vector2 = Input.get_vector("Movement_Left", "Movement_Right", "Movement_Up", "Movement_Down")
	velocity = movement_vector * move_speed
	
	# left and right animations
	if (velocity.x > 0):
		$AnimatedSprite2D.play("Walk_Right")
		$InteractArea2D.position = Vector2(5, 1)
	elif (velocity.x < 0):
		$AnimatedSprite2D.play("Walk_Left")
		$InteractArea2D.position = Vector2(-5, 1)
	
	# up and down animations
	elif (velocity.y < 0):
		$AnimatedSprite2D.play("Walk_Up")
		$InteractArea2D.position = Vector2(0,-4)
	elif (velocity.y > 0):
		$AnimatedSprite2D.play("Walk_Down")
		$InteractArea2D.position = Vector2(0,6)
		
	# stop animations
	else:
		$AnimatedSprite2D.stop()
		
#########################################################################################	

func MoveBlocks():
	collision = get_last_slide_collision()
	if collision:
		var collisionNode = collision.get_collider()
		
		if (collisionNode.is_in_group("Pushable")):
			var collisionNormal: Vector2 = collision.get_normal()
			
			collisionNode.apply_central_force(-collisionNormal * pushStrength)
			#print(collision.get_collider().name)


# NPC Interact Collision
func _on_area_2d_body_entered(body: Node2D) -> void:
	if (body.is_in_group("Interactable")):
		body.canInteract = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if (body.is_in_group("Interactable")):
		body.canInteract = false

func UpdateTreasureLabel():
	var treasureAmount: int = SceneManager.openedChests.size()
	%ScrollLabel.text = str(treasureAmount)
