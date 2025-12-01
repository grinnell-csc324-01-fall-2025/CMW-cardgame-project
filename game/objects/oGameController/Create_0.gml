//Objects for both players, struct declaration can be found at the top of
//CardFuncLib script
player_1 = new player("Player_1");
player_2 = new player("Player_2");

//Booleans to check if both players are ready for combat
p1Input = false;
p2Input = false;

//Not sure about these, might delete them
var p1Cards = [];
var p2Cards = [];

//Creates a duplicate of the players deck, manipulated to represent what
//cards are or are not currently in the deck or hand.
deck = array_create(8, -1);
addCards(deck);

//checks to see if both players have input their played cards
inputCheck = function() {
	if(p1Input && p2Input) {
		p1Input = false;
		p2Input = false;
		alarm[11] = 30;	
	}
}

//checks to see if a deck array is "empty", all values are -1
isEmpty = function(arr) {
	for (var i = 0; i < array_length(arr); i++) {
		if (arr[i] != -1) {
			return false;	
		}
	}
	return true;	
}

//Draws a card and adds it to the players hand
drawCard = function(_deck) {
	//deck = array_create(8, -1);
	var added = false;
	while(!added) {
		if(isEmpty(deck)) {
			addCards(deck);
			for (var j = 0; j < array_length(deck); j++) {
				if(array_contains(hand.inv, deck[j])) {
					deck[j] = -1;	
				}
			}
		}
		idx = round(random_range(0, 7));
		if(_deck[idx] != -1) {
			InvAdd(hand, _deck[idx]);
			_deck[idx] = -1;
			added = true;
		}
	}
}

//Not sure if this works yet, but should call correctly functions from
//CardFuncLib and apply them
function playCard(_card, _player) {
	for(i = 0; i < global.cardData.cardInfo.length; i++) {
		if(global.cardData.cardInfo[i].cardId == _card) {
			playedCard = global.cardData.cardInfo[i];
			break;
		} else {
			//playedCard = global.cardData.cardInfo[0];
		}
	}
	switch(playedCard.effect) {
		case "attack":
			attack(_player, _card.val, _card.cType);
		break;
		
		case "defend":
			defend(_player, _card.val);
		break;
		
		case "heal":
			heal(_player, _card.val);
		break;
		
		case "giveImmunity":
			giveImmunity(_player);
		break;
		
		case "addVal":
			addValChange(_player, _card.val, _card.cType);
		break;
		
		case "multVal":
			multValChange(_player, _card.val, _card.cType);
		break;
	}
}

//Creates a timer that draws a card after a 45 frame delay, repeats 3 times
myTimer = time_source_create(time_source_game, 45, time_source_units_frames, function() {
	drawCard(deck);
	//oGameController.alarm[1] = 1;	
}, [], 3);

time_source_start(myTimer);

//drawCard(deck);
//Start on some code for saving decks, use oInv's for now, maybe change later