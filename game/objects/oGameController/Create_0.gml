var player_1 = new player("Player_1");
var player_2 = new player("Player_2");

var p1Input = false;
var p2Input = false;

var p1Cards = [];
var p2Cards = [];

input_check = function() {
	if(p1Input == true && p2Input == true) {
		alarm[0] = 30;	
	}
}