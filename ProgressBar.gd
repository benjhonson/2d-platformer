extends ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	self.max_value = 20
	self.value = Game.playerHP
	if Game.playerHP > 20:
		self.visible = false
	

func _on_healthbartimer_timeout():
	self.value = Game.playerHP
	if Game.playerHP <= 20:
		self.visible = true
	else:
		self.visible = false
