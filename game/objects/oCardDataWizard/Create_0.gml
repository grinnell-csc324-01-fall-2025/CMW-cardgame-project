file_id = file_text_open_read("sample.txt");

if(file_id < 0) {
	show_debug_message("Error! File not found!");
	exit;
}

