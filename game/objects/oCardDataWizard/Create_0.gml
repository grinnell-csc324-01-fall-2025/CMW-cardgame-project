//fileName = get_open_filename("text", "C:\\Users\\wills\\GameMakerProjects\\GroupProject\\game\\notes\\cardData");
fileId = file_text_open_read("cardData.txt");
//blow your shit off smooth you damned machine
if(fileId < 0) {
	show_debug_message("Error! File not found!");
	exit;
} else {
	show_debug_message(fileId);	
}

//constructor for the cards, less obvious names purposes below
//_val: value of the heal, damage, or shield, for buffs this should be 0
//_effect: this should be a function identifier to something from the CardFuncLib
//_bonus: this is a function identifier to the same place but only fires if rps was won
//_bonusVal: value to be used for the bonus function
function card_obj(_name, _cost, _cType, _val, _description, _effect, _bonus, _bonusVal, _cardId) constructor {
	name = _name;
	cost = real(_cost);
	cType = _cType;
	val = real(_val);
	description = _description;
	effect = _effect;
	bonus = _bonus;
	bonusVal = real(_bonusVal);
	cardId = real(_cardId);
}

/* Loops through the file, constructing cards from the text and adding
   them to an array of usable cards, this array is a global*/
while(!file_text_eof(fileId)) {
	var dataArr = [];
	var line = "";
	while(line != "^v^") {
		line = string_trim_end(file_text_readln(fileId));
		array_push(dataArr, line);
	}
	var newCard = new card_obj(dataArr[0], dataArr[1], dataArr[2], dataArr[3], dataArr[4], dataArr[5], dataArr[6], dataArr[7], dataArr[8]);
	array_push(global.cardData.cardInfo, newCard);
}

//This is a test thing to make sure stuff isn't broken