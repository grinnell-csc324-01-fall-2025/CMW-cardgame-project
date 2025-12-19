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
	thorns = false;
	
	changeHP = function(newHP) {
		hp = newHP;
	}
}

//need to decide if manacheat cards are cheap but expire at the end of a turn, or
//more expensive but stay until next usage. Same with attack enhancements
function manaCheat(_player, _card) {
	var ret = _card.cost;
	switch(_card.cType) {
		case "rock":
			ret -= _player.rockCheat;
			_player.rockCheat = 0;
		break;
		
		case "scissor":
			ret -= _player.scissorCheat;
			_player.scissorCheat = 0;
		break;
		
		case "paper":
			ret -= _player.paperCheat;
			_player.paperCheat = 0;
		break;
		
		default:
			show_debug_message("i mess it up");
	}
	return ret;
}

//I hope this is the first thing you see and if it is, fix all the cases so they are strings as below
function attack(_player, targetPlayer, dmg, _cType){
	var dmgVal = dmg;
	switch (_cType) {
		case "rock":
			dmgVal += _player.rockAdd;
			_player.rockAdd = 0;
			dmgVal *= _player.rockMult;
			_player.rockMult = 1;
		break;
		
		case "scissor":
			dmgVal += _player.scissorAdd;
			_player.scissorAdd = 0;
			dmgVal *= _player.scissorMult;
			_player.scissorMult = 1;
		break;
		
		case "paper":
			dmgVal += _player.paperAdd;
			_player.paperAdd = 0;
			dmgVal *= _player.paperMult;
			_player.paperMult = 1;
		break;
		
		default:
			show_debug_message("i mess it up");
		break;
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
	if(_player.thorns) {
		_player.hp -= 1;	
	}
	return targetPlayer.hp;
}

function defend(_player, shield) {
	_player.shield += shield;
	return _player.shield;
}

function heal(_player, healing) {
	_player.hp += healing;
	return _player.hp;
}

function giveImmunity(_player) {
	_player.immunity = true;
	return _player.immunity;
}

function takeImmunity(_player) {
	_player.immunity = false;	
}

function cheatValChange(_player, cheat, _cType) {
	switch (_cType) {
		case "rock":
			_player.rockCheat += cheat;
		break;
		
		case "scissor":
			_player.scissorCheat += cheat;
		break;
		
		case "paper":
			_player.paperCheat += cheat;
		break;
		
		default:
			show_debug_message("i mess it up");
	}
}

function addValChange(_player, _val, _cType) {
	switch (_cType) {
		case "rock":
			_player.rockAdd += _val;
		break;
		
		case "scissor":
			_player.scissorAdd += _val;
		break;
		
		case "paper":
			_player.paperAdd += _val;
		break;
		
		default:
			show_debug_message("i mess it up");
	}
}

function multValChange(_player, _val, _cType) {
	switch (_cType) {
		case "rock":
			_player.rockMult += _val;
		break;
		
		case "scissor":
			_player.scissorMult += _val;
		break;
		
		case "paper":
			_player.paperMult += _val;
		break;
		
		default:
			show_debug_message("i mess it up");
	}
}

function amp(_card, _val) {
	_card.val += _val;
}