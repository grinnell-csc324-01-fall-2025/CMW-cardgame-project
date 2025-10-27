global.deckData = {};

function saveDeck(){
	global.deckData.cards = playerDeck.inv;
	show_debug_message("Saved Deck!");
}

