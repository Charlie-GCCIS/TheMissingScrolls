extends StaticBody2D

signal switchActivated
signal switchDeactivated

var canInteract: bool = false
var isActivated: bool = false

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
