global.deckData = {};

function saveDeck(roomDeck){
	global.deckData.cards = roomDeck.inv;
	show_debug_message("Saved Deck!");
}

global.deckData.names = ["", "", ""];

