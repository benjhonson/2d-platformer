extends Area2D

var flagVendor
# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("AnimatedSprite2D").play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass # Replace with function body.
		


func _on_body_entered(body):
	if body.name == "Player":
		get_tree().paused = true
		get_node("../Player/Player/AnimatedSprite2D").play("idle")
		get_node("Shop").visible = true
		get_node("Shop/Anim1").play("TransIn")
		flagVendor = 1

