extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	self.max_value = 100
	self.value = Game.pigHP
	


func _on_healthtimer_timeout():
	self.value = Game.pigHP
	
