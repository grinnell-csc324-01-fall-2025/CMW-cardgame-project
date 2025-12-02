if (itemDrag != -1) {
	draw_set_alpha(0.5);
	draw_sprite(CardSlotSpr, itemDrag, mouse_x, mouse_y);
	draw_set_alpha(1.0);
}

if (mouse_check_button(mb_left)) && (slotHover != -1) && (invHover.inv[slotHover] != -1) {
	//while(!mouse_check_button_pressed(mb_left)) {
		draw_sprite_stretched(
			CardSlotSpr, 
			invHover.inv[slotHover], 
			0, 
			0, 
			sprite_get_width(CardSlotSpr)*4,
			sprite_get_height(CardSlotSpr)*4
		)
	//}
} 
