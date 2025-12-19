//Resolve round


//Does the Rps comparison and plays the cards in the correct order, also
//plays cards with their bonus effects if they win the rps
for(var i = 0; i < 3; i++) {
	if(played.inv[i] != -1 && played_op.inv[i] != -1) {
		p1Card = global.cardData.cardInfo[played.inv[i]];
		p2Card = global.cardData.cardInfo[played_op.inv[i]];
		//player 1 beat player 2, player 1's card goes first
		if((p1Card.cType == "rock" && p2Card.cType == "scissor") || // rock beats scissors
	       (p1Card.cType == "scissor" && p2Card.cType == "paper") || // paper beats rock  
	       (p1Card.cType == "paper" && p2Card.cType == "rock")) {
			playCard(p1Card, player_1, true);
			playCard(p2Card, player_2, false);
			//player 2 beat player 1, player 2's card goes first
		} else if((p2Card.cType == "rock" && p1Card.cType == "scissor") || // rock beats scissors
				  (p2Card.cType == "scissor" && p1Card.cType == "paper") || // paper beats rock  
				  (p2Card.cType == "paper" && p1Card.cType == "rock")) {
			playCard(p2Card, player_2, true);
			playCard(p1Card, player_1, false);
			//rps tie, randomly decide who goes first
		} else {
			if(i % 2 == 1) {
				playCard(p2Card, player_2, false);
				playCard(p1Card, player_1, false);
			} else {
				playCard(p1Card, player_1, false);
				playCard(p2Card, player_2, false);
			}
		}
	} else if(played.inv[i] == -1 && played_op.inv[i] == -1) {
		//nothing ever happens
	} else if(played_op.inv[i] != -1) {
		playCard(global.cardData.cardInfo[played_op.inv[i]], player_2, false);
	} else if(played.inv[i] != -1) {
		playCard(global.cardData.cardInfo[played.inv[i]], player_1, false);
	}
}

show_debug_message(player_2.hp);

alarm[11] = 30;