var type = async_load[? "type"]

//check for network connection
if (type == network_type_connect){
	//establish socket from async load
	var socket = async_load[? "socket"]
	
	//create a buffer to send packets
	var buffer = buffer_create(2, buffer_fixed, 1)
	
	//write player data to buffer
	buffer_write(buffer, buffer_u8, DATA.PLAYER_DATA)

	//send buffer through socket
	network_send_packet(socket, buffer, buffer_get_size(buffer))
	//delete buffer
	buffer_delete(buffer)
	//add socket to client list
	ds_list_add(clients, socket)		
} 

else if (type == network_type_data){
	//load buffer from async_load
	var buffer = async_load[? "buffer"]
	//find buffer start
	buffer_seek(buffer, buffer_seek_start, 0);
	//save data from buffer
	var data = buffer_read(buffer, buffer_u8)
	
	if (data == DATA.PLAYER_DATA) {
		
	}
}

