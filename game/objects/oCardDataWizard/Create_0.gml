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
//_effect: this should be a function call to something from the CardFuncLib
function card(_name, _cost, _type, _val, _description, _effect, _cardId) constructor {
	name = _name;
	cost = real(_cost);
	type = _type;
	val = real(_val);
	description = _description;
	effect = _effect;
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
	var newCard = new card(dataArr[0], dataArr[1], dataArr[2], dataArr[3], dataArr[4], dataArr[5], dataArr[6]);
	array_push(global.cardData.cardInfo, newCard);
}

//This is a test thing to make sure stuff isn't broken