invSlots = 8;
rowLength = 8;

if(!struct_exists(global.deckData, "cards")) {
	for(i = 0; i < rowLength; i++) {
		inv[i] = -1;	
	}
} else {
	for(i = 0; i < array_length(global.deckData.cards); i++) {
		inv[i] = global.deckData.cards[i];
	}
}