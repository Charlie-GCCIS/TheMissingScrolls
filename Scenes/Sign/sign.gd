extends StaticBody2D

@export var PuzzleQuestion: String = " "

var canInteract: bool = false
var textVisible: bool = false

func _ready():
	$CanvasLayer/PuzzleQuestionLabel.text = PuzzleQuestion

func _process(delta):
	if Input.is_action_just_pressed("Interact") and canInteract:
		if (textVisible):
			CloseSign()
		else:
			OpenSign()
			
func OpenSign():
	$CanvasLayer.visible = true
	textVisible = true
	get_tree().paused = true
	pass

func CloseSign():
	$CanvasLayer.visible = false
	textVisible = false
	get_tree().paused = false
	pass
