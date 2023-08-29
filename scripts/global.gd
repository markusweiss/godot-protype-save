extends Node


var player_name = "<gd_name>"
var player_id = "<gd_id>"


func save():
	print("save")
	var save_dict = {
		"player_name" : player_name,
		"player_id" : player_id
	}
	return save_dict

func save_data():
	print ("data")
	var save_game = FileAccess.open("res://savegame.dat", FileAccess.WRITE)
	var json_string = JSON.stringify(save())
	save_game.store_line(json_string)
	

func load_data():
	if not FileAccess.file_exists("res://savegame.dat"):
		return
	
	var save_game = FileAccess.open("res://savegame.dat", FileAccess.READ)	
	
	while  save_game.get_position() < save_game.get_length():
		var json_string = save_game.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)
		var node_data = json.get_data()
		
		print(node_data)
