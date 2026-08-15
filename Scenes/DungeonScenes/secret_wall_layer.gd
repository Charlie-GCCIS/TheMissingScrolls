extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func disableSecretWall():
	visible = false
	collision_enabled = false
	
func enableSecretWall():
	visible = true
	collision_enabled = true
