fileName = get_open_filename("text", "C:\\Users\\wills\\GameMakerProjects\\GroupProject\\game\\notes\\cardData");
fileId = file_text_open_read(fileName);
//blow your shit off smooth you damned machine
if(fileId < 0) {
	show_debug_message("Error! File not found!");
	exit;
} else {
	show_debug_message(fileId);	
}

function card(_name, _cost, _type, _val, _description, _effect, _cardId) constructor {
	name = _name;
	cost = real(_cost);
	type = _type;
	val = real(_val);
	description = _description;
	effect = _effect;
	cardId = real(_cardId);
}

while(!file_text_eof(fileId)) {
	var dataArr = [];
	var line = "";
	while(line != "^v^") { //add some indicator at the end of every card object
		line = string_trim_end(file_text_readln(fileId));
		array_push(dataArr, line);
	}
	
	var newCard = new card(dataArr[0], dataArr[1], dataArr[2], dataArr[3], dataArr[4], dataArr[5], dataArr[6]);
	array_push(global.cardData.cardInfo, newCard);
}

//This is a test thing to make sure stuff isn't broken