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
deck2 = array_create(8, -1);
addCards(deck);
addCards(deck2);

//checks to see if both players have input their played cards
inputCheck = function() {
	if(p1Input && p2Input) {
		p1Input = false;
		p2Input = false;
		alarm[0] = 30;	
	}
}

//checks to see if either player is out of hp
gameEndCheck = function() {
	if(player_1.hp <= 0 || player_2.hp <= 0) {
		room_goto(MenuRoom);
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
drawCard = function(_deck, pHand) {
	//deck = array_create(8, -1);
	var added = false;
	while(!added) { // if you go to a spot that has been pulled out of the deck, it goes to -1. this checks for 
		if(isEmpty(_deck)) {
			addCards(_deck);
			for (var j = 0; j < array_length(_deck); j++) {
				if(array_contains(pHand.inv, _deck[j])) {
					_deck[j] = -1; // the index is -1 so we dont draw it again
				}
			}
		}
		idx = round(random_range(0, 7));
		if(_deck[idx] != -1) {
			InvAdd(pHand, _deck[idx]);
			_deck[idx] = -1;
			added = true; // this checks for if the card has been drawn, and redraws for valid cardu
		}
	}
}

//Does work, should correctly call functions from CardFuncLib and apply them'''''''bvvvvvvvv
function playCard(_card, _player, winner) {
	var finalCost = manaCheat(_player, _card);
	if(finalCost > _player.mana) {
		//don't do anything
	} else {
		_player.mana -= finalCost;
		cardEffects(_card, _player, _card.effect, _card.val);
		if(winner) {
			cardEffects(_card, _player, _card.bonus, _card.bonusVal);
		}
	}
}

function cardEffects(_card, _player, func, _val) {
	switch(func) {
			case "attack":
				if(_player == player_1) {
					targetPlayer = player_2;
				} else {
					targetPlayer = player_1;
				}
				attack(_player, targetPlayer, _val, _card.cType);
			break;
		
			case "defend":
				defend(_player, _val);
			break;
		
			case "heal":
				heal(_player, _val);
			break;
		
			case "giveImmunity":
				giveImmunity(_player);
			break;
		
			case "addVal":
				addValChange(_player, _val, _card.cType);
			break;
		
			case "multVal":
				multValChange(_player, _val, _card.cType);
			break;
		}
}

//Creates a timer that draws a card after a 45 frame delay, repeats 3 times
myTimer = time_source_create(time_source_game, 45, time_source_units_frames, function() {
	drawCard(deck, hand);
	drawCard(deck2, hand_op);
	//oGameController.alarm[1] = 1;	
}, [], 3);

time_source_start(myTimer);

//drawCard(deck);
//Start on some code for saving decks, use oInv's for now, maybe change later