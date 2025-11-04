draw_self();

draw_set_font(TxtFont);

//Align text to center of button
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y + 16, Text);	//magic number here is arbitrary, just looks good in this case

//Reset text for next use
draw_set_halign(fa_left);
draw_set_valign(fa_top);