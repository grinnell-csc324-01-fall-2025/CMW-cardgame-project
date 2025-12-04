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
	
	changeHP = function(newHP) {
		hp = newHP;
	}
}

//I hope this is the first thing you see and if it is, fix all the cases so they are strings as below
function attack(_player, targetPlayer, dmg, cType){
	var dmgVal = dmg;
	switch (cType) {
		case "rock":
			dmgVal += _player.rockAdd;
			dmgVal *= _player.rockMult;
		break;
		
		case "scissor":
			dmgVal += _player.scissorAdd;
			dmgVal *= _player.scissorMult;
		break;
		
		case "paper":
			dmgVal += _player.paperAdd;
			dmgVal *= _player.paperMult;
		break;
		
		default:
			show_debug_message("i mess it up");
	}
	
	if(targetPlayer.immunity) {
		dmgVal = 0;	
	}
	
	if(targetPlayer.shield > 0) {
		if(dmgVal > targetPlayer.shield) {
			dmgVal -= targetPlayer.shield;
			targetPlayer.shield = 0;
		} else {
			targetPlayer.shield -= dmgVal;
			dmgVal = 0;
		}
	}
	targetPlayer.hp -= dmgVal;
}

function defend(_player, shield) {
	_player.shield += shield;	
}

function heal(_player, healing) {
	_player.hp += healing;
}

function giveImmunity(_player) {
	_player.immunity = true;
}

function cheatValChange(_player, val, cType) {
	switch (cType) {
		case "rock":
			_player.rockCheat += val;
		break;
		
		case "scissor":
			_player.scissorCheat += val;
		break;
		
		case "paper":
			_player.paperCheat += val;
		break;
		
		default:
			show_debug_message("i mess it up");
	}
}

function addValChange(_player, val, cType) {
	switch (cType) {
		case "rock":
			_player.rockAdd += val;
		break;
		
		case "scissor":
			_player.scissorAdd += val;
		break;
		
		case "paper":
			_player.paperAdd += val;
		break;
		
		default:
			show_debug_message("i mess it up");
	}
}

function multValChange(_player, val, cType) {
	switch (cType) {
		case "rock":
			_player.rockMult += val;
		break;
		
		case "scissor":
			_player.scissorMult += val;
		break;
		
		case "paper":
			_player.paperMult += val;
		break;
		
		default:
			show_debug_message("i mess it up");
	}
}

