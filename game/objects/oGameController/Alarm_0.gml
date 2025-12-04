//Resolve round

//After recieving card choices from both players, evaluate cards by comparison
//Compare first set, then second, then third. If either player's card beats the
//other, ex. rock beats scissors, it gets priority and its effect is evaluated
//first, then the other cards effect fires. If either evaluated card is null, i.e
//no card was played, or the played card's mana cost is too high to be played, it fizzles
//and the other card is evaluated.

/*for(i = 0; i < 3; i++) {
	if((p1Cards[i].type == "rock" && p2Cards[i].type == "scissors") || // rock beats scissors
       (p1Cards[i].type == "scissors" && p2Cards[i].type == "paper") || // paper beats rock  
       (p1Cards[i].type == "paper" && p2Cards[i].type == "rock")) {
		//thing happens
	} else if((p2Cards[i].type == "rock" && p1Cards[i].type == "scissors") || // rock beats scissors
			  (p2Cards[i].type == "scissors" && p1Cards[i].type == "paper") || // paper beats rock  
			  (p2Cards[i].type == "paper" && p1Cards[i].type == "rock")) {
		//other thing happens
	} else {
		//nothing ever happens	
	}
}
*/
for(var i = 0; i < 3; i++) {
	if (played.inv[i] != -1) {
		curr = global.cardData.cardInfo[played.inv[i]];
		playCard(curr, player_1);
	}
}

show_debug_message(player_2.hp);

alarm[11] = 30;