draw_self();
draw_set_font(TxtFont);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if(inputString == "" && !hasFocus && nameString == "") {
	draw_text(x, y, "Name Deck")	
} else {
	draw_text(x, y, inputString);
}

/*if(hasFocus && (current_time div 500) mod 2 == 0) {
	var _text_width = string_width(string_copy(inputString, 1, cursorPos));
	draw_line(x + 5 + _text_width, y, x + 5 + _text_width, y + string_height(inputString));
}*/

draw_set_halign(fa_left);
draw_set_valign(fa_top);