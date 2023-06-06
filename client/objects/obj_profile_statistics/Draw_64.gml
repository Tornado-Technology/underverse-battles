if (!is(account) || !is(profile)) {
	exit;
}

draw_reset();

var width = room_width;
var width_center = room_width / 2;
var width_third = room_width / 3;
var width_quarter = room_width / 4;

draw_set_font(global._font_main_determination);
draw_set_halign(fa_left);

var username_offset = 0;

var badge = profile.get_badge()
if (is(badge)) {
	draw_sprite(spr_badges, badge, width_center, 108);
	username_offset += 10;
}

draw_text_outlined(width_center + username_offset, 100, c_white, c_black, account.get_username());
var rp = profile.get_rating();
draw_text_outlined(width_center, 120, c_white, c_black, translate_get("Menu.Statistics.Rating") + ": " + string(rp));

//Rank
var value = set_rank(rp);
draw_text_outlined(width_center, 140, value[1], c_black, translate_get("Menu.Statistics.Rank") + ": " + value[0]);
draw_text_outlined(width_center, 160, c_yellow, c_black, translate_get("Menu.Statistics.Gold") + ": " + string(profile.get_gold()));
