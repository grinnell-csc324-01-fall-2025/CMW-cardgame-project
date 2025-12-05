if (room = GameRoom) {
	if (keyboard_check(vk_space)){
		//establish a server
		server = network_create_server(network_socket_tcp, server_port, 1)
		
		//server creation failed
		if (server < 0){
			show_error("Could not create a server." , false);
				
		} 
		//success
		else {
			room_goto(GameRoom);
			
			is_server = true;
			
		}	
	}
	else if (keyboard_check(vk_enter)){
		//create a socket to connect to server
		server = network_create_socket(network_socket_tcp);
		//establish server socket connection
		var connect = network_connect(server, server_ip, server_port);
		//failure
		if (connect < 0){
			show_error("Could not connect to server.", false);
			show_error("a test error", false);
		} 
		//success
		else {
			room_goto(GameRoom);
			//testing
		}
				
	}
	
	
}