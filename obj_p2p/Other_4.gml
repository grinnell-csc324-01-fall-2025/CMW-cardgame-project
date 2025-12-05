//check if we are in the right room
if (room == GameRoom){
	//if this is the server, add it to the client list
	if (is_server){
		ds_list_add(clients, -1)
	}
}