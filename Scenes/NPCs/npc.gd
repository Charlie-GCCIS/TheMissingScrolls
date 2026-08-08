extends StaticBody2D

var canInteract: bool = false

@export var dialogue: Array[String] = ["Hi", "How are you?", "hehe"]
var dialogueIndex: int = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Interact") and canInteract):
		$CanvasLayer.visible = true
		get_tree().paused = true
		
		if (dialogueIndex < dialogue.size()):
			$CanvasLayer/DialogueLabel.text = dialogue[dialogueIndex]
			dialogueIndex+=1
		else:
			dialogueIndex = 0
			$CanvasLayer.visible = false
			get_tree().paused = false
			
