draw_self();

draw_set_font(MenuFont);

//Align text to center of button
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, ButtonText);

//Reset text for next use
draw_set_halign(fa_left);
draw_set_valign(fa_top);