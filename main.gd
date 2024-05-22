extends Node2D

func _ready():
	Utils.loadGame()
	Utils.saveGame()


func _on_quit_button_pressed():
	get_tree().quit()


func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	Game.playerHP = 20
	Game.Gold = 999	
	Game.jump_max = 1

func _on_load_game_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	
