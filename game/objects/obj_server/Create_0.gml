//Server Info
//port constant
#macro PORT 3000
//create server
server = network_create_server(network_socket_tcp, PORT, 1)


//client list
clients = ds_list_create();
sockets = ds_list_create();
