// HEALTH

// values for health bar -> x2/y2 refers to player 2's placement, x1/y1 refers to player 1's placement
var _x2 = 16;
var _y2 = 16;
var _x1 = 1069;
var _y1 = 530;

var barw = 256;
var barh = 32;

// Properties of the Health Bar
draw_set_font(MenuFont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Player 2 Healthbar 
var health_barw_2 = barw * (player_2.hp / 20);
draw_sprite_stretched(sprBox, 0, _x2, _y2, barw, barh);
draw_sprite_stretched_ext(sprBox, 1, _x2, _y2, health_barw_2, barh, c_red, 0.6);

draw_text(_x2 + barw /2, _y2 + barh /2, $"P2 HP {player_2.hp}");


// Player 1 healthbar
var health_barw_1 = barw * (player_1.hp / 20);
draw_sprite_stretched(sprBox, 0, _x1, _y1, barw, barh);
draw_sprite_stretched_ext(sprBox, 1, _x1, _y1, health_barw_1, barh, c_red, 0.6);

draw_text(_x1 + barw /2, _y1 + barh /2, $"P1 HP {player_1.hp}");


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// MANA

// Player 2 Mana
var mana_barw_2 = barw * (player_2.mana / 3); // -> needs to be changed for dynamic mana increase
_y2 += barh + 8;
draw_sprite_stretched(sprBox, 0, _x2, _y2, barw, barh);
draw_sprite_stretched_ext(sprBox, 1, _x2, _y2, mana_barw_2, barh, c_aqua, 0.6);

draw_text(_x2 + barw /2, _y2 + barh /2, $"MANA {player_2.mana}");

// Player 1 Mana
var mana_barw_1 = barw * (player_1.mana / 3); // -> needs to be changed for dynamic mana increase
_y1 += barh + 8;
draw_sprite_stretched(sprBox, 0, _x1, _y1, barw, barh);
draw_sprite_stretched_ext(sprBox, 1, _x1, _y1, mana_barw_1, barh, c_aqua, 0.6);

draw_text(_x1 + barw /2, _y1 + barh /2, $"MANA {player_1.mana}");


// reset properties
draw_set_halign(fa_left);
draw_set_valign(fa_top);