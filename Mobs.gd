extends Node2D


var Frog = preload("res://Mobs/frog.tscn")
var maxFrogs = 16  # Set your desired maximum number of frogs
var currentFrogCount = 0


func _on_timer_timeout():
	if currentFrogCount < maxFrogs:
		var frogTemp1 = Frog.instantiate()
		var frogTemp2 = Frog.instantiate()
		
		var rng = RandomNumberGenerator.new()
		var ranint = rng.randi_range(32,6192)
		var ranint1 = rng.randi_range(32,6192)
		
		frogTemp1.position = Vector2(ranint,728)
		frogTemp2.position = Vector2(ranint1,728)
		add_child(frogTemp1)
		add_child(frogTemp2)
		currentFrogCount += 2
