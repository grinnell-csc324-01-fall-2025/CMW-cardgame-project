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

for (var i = 0; i < 3; i++) {
	time_source_start(myTimer);
}