/// @description End monolog
if (act < 1) exit;
	
if (cur_num == str_num) {
	act = 0;
	
	switch(tab) {
		case 2:
			set_tab(0);
			break;
		case 4:
			transition();
			break;
	}
}