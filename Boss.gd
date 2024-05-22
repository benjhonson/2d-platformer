extends Node2D


var Frog = preload("res://Boss/pig.tscn")
var maxFrogs = 1  # Set your desired maximum number of frogs
var currentFrogCount = 0


func _on_timer_timeout():
	if currentFrogCount < maxFrogs:
		var frogTemp1 = Frog.instantiate()
		frogTemp1.scale.x = 5
		frogTemp1.scale.y = 5
		frogTemp1.position = Vector2(2944,200)
		add_child(frogTemp1)
		currentFrogCount += 1
