///@desc State machine
invHover = -1;
slotHover = -1;
invDrag = -1;
slotDrag = -1;
itemDrag = -1;

mouseOver = function() {
	//empty hover results
	slotHover = -1;
	invHover = -1;
	
	//mouse coords
	var mx = mouse_x;
	var my = mouse_y;
	
	with(oInv) {
		if (point_in_rectangle (
			mx,
			my,
			x-6,
			y-6,
			x-6 + 12+rowLength*68,
			y-6 + 12+(((invSlots-1) div rowLength)+1)*68
		)) {
			//check for mouseover in each slot
			for(var i = 0; i < invSlots; i += 1) {
				var	xpos = x + (i mod rowLength) * 68 + 2;
				var ypos = y + (i div rowLength) * 68 + 2;
				if (point_in_rectangle(mx, my, xpos, ypos, xpos+64, ypos+64)) {
					other.slotHover = i;
					other.invHover = id;
				}
			}
		}
	}
}

stateFree = function() {
	mouseOver();
	//Start to drag an item if slot isnt empty
	if (mouse_check_button(mb_left)) && (slotHover != -1) && (invHover.inv[slotHover] != -1) {
		//Enter drag state
		state = stateDrag;
		itemDrag = invHover.inv[slotHover];
		invDrag = invHover;
		slotDrag = slotHover;
	}
}

stateDrag = function() {
	mouseOver();
	if (!mouse_check_button(mb_left)) {
		//Swap with slot if hovering
		if (slotHover != -1) InvSwap(invDrag, slotDrag, invHover, slotHover);
		
		//Return to free state
		state = stateFree;
		itemDrag = -1;
		invDrag = -1;
		slotDrag = -1;
	}
}

state = stateFree;