extends StaticBody2D

@export var chestName: String
var canInteract: bool = false
var isOpen: bool = false
var openedPreviously: bool = false

func _ready():
	if SceneManager.openedChests.has(chestName):
		$AnimatedSprite2D.play("open")
		openedPreviously = true

func _process(delta):
	if Input.is_action_just_pressed("Interact") and canInteract:
		if (!isOpen):
			OpenChest()

			
func OpenChest():
	isOpen = true
	$AnimatedSprite2D.play("open")
	if (!openedPreviously):
		$Scroll.visible = true
		$Timer.start()
	SceneManager.openedChests.append(chestName)
	
func CloseChest():
	$Scroll.visible = false
