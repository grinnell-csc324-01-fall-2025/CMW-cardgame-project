if(hasFocus) {
	if(keyboard_check(vk_anykey) && string_length(inputString) < 20) {
		inputString += string(keyboard_string)
		keyboard_string = "";
	}
	
	if(keyboard_check(vk_backspace) && !keyboard_check_pressed(vk_backspace) && delete_timer == 2) {
		inputString = string_delete(inputString, string_length(inputString) - 1, 1);
		delete_timer = 0;
		keyboard_string = "";
	}
	
	if(keyboard_check_pressed(vk_backspace)) {
		inputString = string_delete(inputString, string_length(inputString) - 1, 1);
		keyboard_string = "";
		delete_timer = -4;
	}
	
	if(keyboard_check(vk_enter)) {
		hasFocus = false;
		ipString = inputString;
		global.USR_IP = inputString;
		keyboard_string = "";
	}
	
	if(delete_timer != 2) {
		delete_timer++;	
	}
}