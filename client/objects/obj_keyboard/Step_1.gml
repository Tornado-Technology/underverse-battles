for (var i = 0; i < array_length(clear_keys); i++) {
	if (__keyboard_check(clear_keys[i])) continue;
	
	array_delete(clear_keys, i, 1);
}
