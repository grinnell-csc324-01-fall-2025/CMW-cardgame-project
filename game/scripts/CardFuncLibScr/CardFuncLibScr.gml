function player(_name) constructor {
	name = _name;
	hp = 20;
	shield = 0;
	mana = 3;
	immunity = false;
	rockCheat = 0;
	scissorCheat = 0;
	paperCheat = 0;
	rockAdd = 0;
	rockMult = 1;
	scissorAdd = 0;
	scissorMult = 1;
	paperAdd = 0;
	paperMult = 1;
}

function attack(_player, dmg, cardType){
	var dmgVal = dmg;
	switch (cardType) {
		case rock:
			dmgVal += Add;
			dmgVal *= Mult;
		break;
		
		case scissor:
			dmgVal += scissorAdd;
			dmgVal *= scissorMult;
		break;
		
		case paper:
			dmgVal += paperAdd;
			dmgVal *= paperMult;
		break;
		
		default:
			show_debug_message("we fucked up");
	}
	
	if(immunity) {
		dmgVal = 0;	
	}
	
	if(_player.shield > 0) {
		if(dmgVal > player.shield) {
			dmgVal -= player.shield;
			_player.shield = 0;
		} else {
			_player.shield -= dmgVal;
			dmgVal = 0;
		}
	}
	_player.hp -= dmgVal;
}

function defend(_player, shield) {
	_player.shield += shield;	
}

function heal(_player, healing) {
	_player.hp += healing;
}

function cheatValChange(_player, val, type) {
	switch (type) {
		case rock:
			_player.rockCheat += val;
		break;
		
		case scissor:
			_player.scissorCheat += val;
		break;
		
		case paper:
			_player.paperCheat += val;
		break;
		
		default:
			show_debug_message("we f'd up");
	}
}

function addValChange(_player, val, type) {
	switch (type) {
		case rock:
			_player.rockAdd += val;
		break;
		
		case scissor:
			_player.scissorAdd += val;
		break;
		
		case paper:
			_player.paperAdd += val;
		break;
		
		default:
			show_debug_message("we f'd up");
	}
}

function multValChange(_player, val, type) {
	switch (type) {
		case rock:
			_player.rockMult += val;
		break;
		
		case scissor:
			_player.scissorMult += val;
		break;
		
		case paper:
			_player.paperMult += val;
		break;
		
		default:
			show_debug_message("we f'd up");
	}
}

