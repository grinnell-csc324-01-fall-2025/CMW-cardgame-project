draw_sprite_stretched (
	sprInvSlot,
	0,
	x-6,
	y-6,
	12+rowLength*68,
	12+(((invSlots-1) div rowLength)+1)*68
);

for (var i = 0; i < invSlots; i += 1) {
	var	xpos = x + (i mod rowLength) * 68 + 2;
	var ypos = y + (i div rowLength) * 68 + 2;
	draw_sprite(sprSlotOver, 0, xpos, ypos);
	if (inv[i] != -1) {
		draw_sprite(sprCardSlot, inv[i], xpos + 12, ypos);
	}
}