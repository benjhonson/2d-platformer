extends Node2D


var Cherry = preload("res://Collection/Cherry.tscn")



func _on_timer_timeout():
	var cherryTemp = Cherry.instantiate()
	var cherryTemp1 = Cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var ranint = rng.randi_range(32,6192)
	var ranint2 = rng.randi_range(32,6192)
	var ranint1 = rng.randi_range(88,728)
	var ranint12 = rng.randi_range(88,728)
	cherryTemp.position = Vector2(ranint,ranint1)
	cherryTemp1.position = Vector2(ranint2,ranint12)
	get_node("cherrygrp").add_child(cherryTemp)
