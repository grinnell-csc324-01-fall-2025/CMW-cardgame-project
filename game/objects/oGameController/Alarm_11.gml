//This clears all cards from the hand and playing field and then
//sets up for the next turn

//show_debug_message("Got in");

for (var i = 0; i < hand.invSlots; i++) {
	hand.inv[i] = -1;
	hand_op.inv[i] = -1;
}

for (var i = 0; i < played.invSlots; i++) {
	played.inv[i] = -1;
	played_op.inv[i] = -1;
}

player_1.mana = 3;
player_2.mana = 3;

player_1.immunity = false;
player_2.immunity = false;

player_1.thorns = false;
player_2.thorns = false;

for (var i = 0; i < 3; i++) {
	time_source_start(myTimer);
}