if (account == undefined || profile == undefined)
	exit;
	
draw_reset();

var width = room_width;
var width_center = room_width / 2;
var width_third = room_width / 3;
var width_quarter = room_width / 4;

draw_set_font(global._font_main_determination);
draw_set_halign(fa_left);

var username_offset = 0;
if (profile.badge != undefined) {
	draw_sprite(spr_badges, profile.badge, width_center, 108);
	username_offset += 10;
}

draw_text_outlined(width_center + username_offset, 100, c_white, c_black, string(account.username));
var rp = profile.rating;
draw_text_outlined(width_center, 120, c_white, c_black, translate_get("Menu.Statistics.Rating") + ": " + string(rp));

//Rank
var struct = set_rank(rp);
draw_text_outlined(width_center, 140, struct.color, c_black, translate_get("Menu.Statistics.Rank") + ": " + struct.rank);
draw_text_outlined(width_center, 160, c_yellow, c_black, translate_get("Menu.Statistics.Gold") + ": " + string(profile.gold));
