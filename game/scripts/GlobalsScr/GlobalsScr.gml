global.deckData = {};
global.deckData.cards = [1, 5, 3, 6, 9, 2, 10, 7]

function saveDeck(roomDeck){
	global.deckData.cards = roomDeck.inv;
	show_debug_message("Saved Deck!");
}

function addCards(arr) {
	if(!struct_exists(global.deckData, "cards")) {
		for(i = 0; i < rowLength; i++) {
			arr[i] = -1;	
		}
	} else {
		for(i = 0; i < array_length(global.deckData.cards); i++) {
			arr[i] = global.deckData.cards[i];
		}
	}
}

global.deckData.names = ["", "", ""];

global.cardData = {};

global.cardData.cardInfo = [];