extends StaticBody2D

signal switchActivated
signal switchDeactivated

var canInteract: bool = false
var isActivated: bool = false

var isSecret: bool = false
@export var doorsNeeded: int
var doorsOpened: int = 0

func _process(delta):
	if Input.is_action_just_pressed("Interact") and canInteract:
		if (isActivated):
			DeactivateSwitch()
		else:
			ActivateSwitch()


func DeactivateSwitch():
	isActivated = false
	switchDeactivated.emit()
	$AnimatedSprite2D.play("unactivated")
	
func ActivateSwitch():
	isActivated = true
	switchActivated.emit()
	$AnimatedSprite2D.play("activated")

func MakeVisible():
	doorsOpened += 1
	if (doorsNeeded <= doorsOpened):
		visible = true
		$CollisionShape2D.set_deferred("disabled", false)

func MakeInvisible():
	doorsOpened -= 1
	if (doorsNeeded > doorsOpened):
		visible = false
		$CollisionShape2D.set_deferred("disabled", true)
