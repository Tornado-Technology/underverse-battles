blackout_alpha = approach(blackout_alpha, is_blackout ? blackout_taget_alpha : 0, is_blackout ? 0.08 : 0.1);
logo_alpha = approach(logo_alpha, is_logo_open, is_logo_open ? 0.08 : 0.1);

is_blackout = is_make_blackout ? true : page_index != menu_page.main;
is_logo_open = is_make_logo_open ? false : page_index == menu_page.main;

if (pause) exit;

page_x = lerp(page_x, elements_show ? page_target_x : page_start_x, 0.1);

if (!elements_show) {
	exit;
}

for (var i = 0; i < elements_count; i++) {
	get_element_in_page(i).update(page_x, page_y + page_element_offset * i, id);
}

