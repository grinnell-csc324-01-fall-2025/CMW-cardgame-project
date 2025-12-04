// values for health bar
var _x = 16;
var _y = 16;
var barw = 256;
var barh = 32;

// Properties of the Health Bar
draw_set_font(MenuFont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Healthbar width
var health_barw = barw * (player_1.hp / 20);
draw_sprite_stretched(sprBox, 0, _x, _y, barw, barh);
draw_sprite_stretched_ext(sprBox, 1, _x, _y, health_barw, barh, c_red, 0.6);

draw_text(_x + barw /2, _y + barh /2, $"HP {player_1.hp}");

// Mana
var mana_barw = barw * (player_1.mana / 3); // -> needs to be changed for dynamic mana increase
_y += barh + 8;
draw_sprite_stretched(sprBox, 0, _x, _y, barw, barh);
draw_sprite_stretched_ext(sprBox, 1, _x, _y, mana_barw, barh, c_aqua, 0.6);

draw_text(_x + barw /2, _y + barh /2, $"MANA {player_1.mana}");

// reset properties
draw_set_halign(fa_left);
draw_set_valign(fa_top);