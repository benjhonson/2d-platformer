extends Node


var SAVE_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH,FileAccess.WRITE)
	var data: Dictionary = {
		"playerHP": Game.playerHP ,
		"Gold": Game.Gold,
		"Jump_Max": Game.jump_max,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)


func loadGame():
	var  file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists(SAVE_PATH) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Game.Gold = current_line["Gold"]
				Game.playerHP = current_line["playerHP"]
				Game.jump_max = current_line["Jump_Max"]
				if Game.playerHP == 0:
					Game.playerHP = 20
					Game.Gold = 999	
					Game.jump_max = 1
				
				
