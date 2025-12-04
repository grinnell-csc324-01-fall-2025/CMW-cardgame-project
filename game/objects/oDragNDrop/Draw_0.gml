//This handles drag and drop trailing images
if (itemDrag != -1) {
	draw_set_alpha(0.5);
	draw_sprite(sprCardSlot, itemDrag, mouse_x, mouse_y);
	draw_set_alpha(1.0);
}

//This is for the card focus
if (mouse_check_button(mb_left)) && (slotHover != -1) && (invHover.inv[slotHover] != -1) {
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
} 
