extends Area2D

@export var is_single_use: bool

var bodiesOnTop: int = 0
signal pressed
signal unpressed

func _on_body_entered(body: Node2D) -> void:
	bodiesOnTop += 1
	print("something pressed the button")
	if body.is_in_group("Pushable") or body is Player:
		if bodiesOnTop == 1:
			print("pressed the button")
			$AnimatedSprite2D.play("pressed")
			pressed.emit()
		
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	if is_single_use:
		return	
	
	bodiesOnTop -= 1
	if (body.is_in_group("Pushable") or body is Player):
		if bodiesOnTop == 0:
			$AnimatedSprite2D.play("unpressed")
			unpressed.emit()
			
	pass # Replace with function body.
