draw_reset();

draw_set_font(font_determination);
draw_set_halign(fa_center);
	
if (alpha > 0) {
	alpha = approach(alpha, 0, 0.01);
}

draw_set_alpha(alpha);
	
if (draw_dodge) {
	draw_text_outlined(x, y, c_aqua, c_black, translate_get("Battle.Dodge"));
}

if (draw_damage) {
	if (damage > 0)
		draw_text_outlined(x, y, c_red, c_black, string(damage));
	else if (damage < 0)
		draw_text_outlined(x, y, c_green, c_black, string(-damage));
	else
		draw_text_outlined(x, y, c_gray, c_black, translate_get("Battle.Miss"));

}

if (draw_heal) {
	if (damage == 0) {
		draw_text_outlined(x, y, c_green, c_black, translate_get("Battle.Max"));
	} else {
		draw_text_outlined(x, y, c_green, c_black, string(damage));
	}
}

draw_reset();