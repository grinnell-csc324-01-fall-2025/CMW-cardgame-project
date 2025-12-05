//Server Info
//get local ip
server_ip = "127.0.0.1";
//establish port
server_port = 3000;
//bool to store who is server
isServer = false;
//storage of player data
enum DATA {
	PLAYER_DATA
}
//client list
clients = ds_list_create();
