extends StaticBody2D

@export var buttonsNeeded: int = 1
var buttonsPressed: int = 0

func _on_puzzle_button_pressed() -> void:
	buttonsPressed += 1
	if (buttonsPressed == buttonsNeeded):
		visible = false
		$CollisionShape2D.set_deferred("disabled", true)


func _on_puzzle_button_unpressed() -> void:
	buttonsPressed -= 1
	if (!buttonsPressed == buttonsNeeded):
		visible = true
		$CollisionShape2D.set_deferred("disabled", false)
