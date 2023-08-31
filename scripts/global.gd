extends Node


var player_name: String = "<gd_name>"
var player_id: String= "<gd_id>"

const SAVEGAME: String = "res://savegame.json"


func save():
	print("save")
	var save_dict = {
		"player_name" : player_name,
		"player_id" : player_id
	}
	return save_dict

func save_data():
	print ("data")
	var save_game = FileAccess.open(SAVEGAME, FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	save_game.store_line(json_string)
	

func load_data():
	if not FileAccess.file_exists(SAVEGAME):
		return
	
	var save_game = FileAccess.open(SAVEGAME, FileAccess.READ)	
	
	while  save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		print(node_data)
