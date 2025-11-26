function ShuffleDeck(){
	////generate a random number from randomized GML seed
	var randomNum = random_get_seed();
	
	
	/*
	
	write wht allows a turn, and other person take s turn''
	
	network: emulate, pull information and demo running xx function as if a player played it
	
	dont over abstract stuff
	*/
	
	// Create an array of size 20
	var my_array = array_create(12);

	//based on random num, generate a set of numbers
	for (var i = 0; i < 12; i++) {
	    my_array[i] = irandom_range(1, 12);
	}
	
	
	// TESTING: Display the array contents :DDDDDDD
	show_debug_message("Array contents:");
	for (var i = 0; i < 12; i++) {
	    show_debug_message("Index " + string(i) + ": " + string(my_array[i]));
	}
	
	
	//use the numbers to pull card sprites
	for (var i = 1; i < 12; i++) {
        var frame = my_array[i] - 1;  // sprite frames start at 1 cuz the first is the default
        var card = instance_create_layer(100 + i * 20, 100, "BattleRoom", obj_card);

        card.sprite_index = spr_cards;
        card.image_index  = frame;   
    }
}