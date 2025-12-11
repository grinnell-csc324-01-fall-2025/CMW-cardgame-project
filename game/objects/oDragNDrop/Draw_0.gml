//This handles drag and drop trailing images
if (itemDrag != -1) {
	draw_set_alpha(0.5);
	draw_sprite(sprCardSlot, itemDrag, mouse_x, mouse_y);
	draw_set_alpha(1.0);
} else {
	if((slotHover != -1) && (invHover.inv[slotHover] != -1)) {
		/*(
			sprCardSlot, 
			invHover.inv[slotHover], 
			0, 
			0, 
			sprite_get_width(sprCardSlot)*4,
			sprite_get_height(sprCardSlot)*4
		)*/
		draw_set_colour(c_black);
		draw_rectangle(0, 200, 0 + 200, 200 + 200, false);
		draw_set_font(TxtFont);
		draw_set_colour(c_white);
		var cardTxt = WordWrapScr(/*global.cardData.cardInfo[invHover.inv[slotHover]].description*/"This is just one big long elaborate test so I really hope this works out", 200, "\n", false);
		draw_text(0 + 5, 200, cardTxt);
	}
}

//This is for the card focus
/*if (mouse_check_button(mb_left)) && (slotHover != -1) && (invHover.inv[slotHover] != -1) {
	//while(!mouse_check_button_pressed(mb_left)) {
		draw_sprite_stretched(
			sprCardSlot, 
			invHover.inv[slotHover], 
			0, 
			0, 
			sprite_get_width(sprCardSlot)*4,
			sprite_get_height(sprCardSlot)*4
		)
	//}
} */
