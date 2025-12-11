var event_id = async_load[? "id"]

//check for network connection
if (server == event_id) {
	var type = async_load[? "type"]
	var sock = async_load[? "sock"]
	
	//connect
	if (type == network_type_connect){
		//add socket to client list
		ds_list_add(sockets, sock)
		
	}
	
	//disconnect
	
	if (type == network_type_disconnect){
		
		//remove socket from client list
		ds_list_delete(sockets, ds_list_find_index(sockets, sock))
		//remove player from game

		
	}
	
	
}

