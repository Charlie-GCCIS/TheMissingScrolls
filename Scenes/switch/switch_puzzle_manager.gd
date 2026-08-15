extends Marker2D

@export var targetScore: int
signal puzzleSolved
signal puzzleFailed

var score: int

func IncreaseScore():
	score += 1
	
	if score >= targetScore:
		puzzleSolved.emit()
	
func DecreaseScore():
	score-=1
	
	if score < targetScore:
		puzzleFailed.emit()
