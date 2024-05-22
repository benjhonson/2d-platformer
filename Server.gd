extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text  = str(Game.playerHP)
	if self.visible == true:
		get_node("../Timer").start()
	


func _on_timer_timeout():
	self.visible = false
