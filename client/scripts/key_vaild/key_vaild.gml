function key_vaild(key_index) {
	if (key_index >= ord("A") && key_index <= ord("Z")) return true;
	if (key_index == vk_space) return true;
	if (key_index == vk_escape) return true;
	if (key_index == vk_shift) return true;
	if (key_index == vk_tab) return true;
	
	return false;
}