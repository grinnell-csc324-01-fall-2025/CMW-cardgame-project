//Resolve round

//After recieving card choices from both players, evaluate cards by comparison
//Compare first set, then second, then third. If either player's card beats the
//other, ex. rock beats scissors, it gets priority and its effect is evaluated
//first, then the other cards effect fires. If either evaluated card is null, i.e
//no card was played, or the played card's mana cost is too high to be played, it fizzles
//and the other card is evaluated.

for(var i = 0; i < 3; i++) {
	if(played.inv[i] != -1 && played_op.inv[i] != -1) {
		p1Card = global.cardData.cardInfo[played.inv[i]];
		p2Card = global.cardData.cardInfo[played_op.inv[i]];
		//player 1 beat player 2, player 1's card goes first
		if((p1Card.cType == "rock" && p2Card.cType == "scissors") || // rock beats scissors
	       (p1Card.cType == "scissors" && p2Card.cType == "paper") || // paper beats rock  
	       (p1Card.cType == "paper" && p2Card.cType == "rock")) {
			playCard(p1Card, player_1);
			playCard(p2Card, player_2);
			//player 2 beat player 1, player 2's card goes first
		} else if((p2Card.cType == "rock" && p1Card.cType == "scissors") || // rock beats scissors
				  (p2Card.cType == "scissors" && p1Card.cType == "paper") || // paper beats rock  
				  (p2Card.cType == "paper" && p1Card.cType == "rock")) {
			playCard(p2Card, player_2);
			playCard(p1Card, player_1);
			//rps tie, randomly decide who goes first
		} else {
			if(i % 2 == 1) {
				playCard(p2Card, player_2);
				playCard(p1Card, player_1);
			} else {
				playCard(p1Card, player_1);
				playCard(p1Card, player_2);
			}
		}
	} else if(played.inv[i] == -1 && played_op.inv[i] == -1) {
		//nothing ever happens
	} else if(played_op.inv[i] != -1) {
		playCard(global.cardData.cardInfo[played_op.inv[i]], player_2);
	} else if(played.inv[i] != -1) {
		playCard(global.cardData.cardInfo[played.inv[i]], player_1);
	}
}

/*for(var i = 0; i < 3; i++) {
	if (played.inv[i] != -1) {
		curr = global.cardData.cardInfo[played.inv[i]];
		playCard(curr, player_1);
	}
}*/

show_debug_message(player_2.hp);

alarm[11] = 30;