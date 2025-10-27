function InvSearch(rootObject, itemType) {
	for (var i = 0; i < invSlots; i += 1) {
		if (rootObject.inv[i] == itemType) {
			return(i);
		}
	}
	return(-1);
}

function InvRemove(rootObject, itemType) {
	var _slot = InvSearch(rootObject, itemType)
	//if item is in inventory
	if (_slot != -1) {
		//remove it
		with (rootObject) inv[_slot] = -1;
		return true;
	} else {
		//fail gracefully
		return false;
	}
}

function InvAdd(rootObject, itemType) {
	var _slot = InvSearch(rootObject, -1)
	//if theres an empty spot in the inventory
	if (_slot != -1) {
		//add the item
		with (rootObject) inv[_slot] = itemType;
		return true;
	} else {
		//fail gracefully
		return false;
	}
}

function InvSwap(objectFrom, slotFrom, objectTo, slotTo) {
	var _itemFrom = objectFrom.inv[slotFrom];
	objectFrom.inv[slotFrom] = objectTo.inv[slotTo];
	objectTo.inv[slotTo] = _itemFrom;
}