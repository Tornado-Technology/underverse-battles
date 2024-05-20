/// @desc Start monolog
if (act != 1) exit;

cur_num = 0;
str_num = array_length(monolog);
		
for (var i = 0; i < str_num; i++) {
	text[i] = monolog[i];
}
	
act = 2;
event_user(2);