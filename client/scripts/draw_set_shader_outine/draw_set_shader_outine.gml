/// @param {Asset.GMSprite} sprite
/// @param {Constant.Color} color
/// @param {Real} sumbing
function draw_set_shader_outine(sprite, color, sumbing = 0) {
	shader_set(shd_outline);
	
	var vec4 = {
		r: color_get_red(color),
		g: color_get_green(color),
		b: color_get_blue(color),
		a: draw_get_alpha()
	};
	
	var texture = sprite_get_texture(sprite, sumbing);
	var texture_width = texture_get_texel_width(texture);
	var texture_height = texture_get_texel_height(texture);
	var uniform;

	uniform = shader_get_uniform(shd_outline, "in_Texel");
	shader_set_uniform_f(uni, texture_width, texture_height);
	
	uniform = shader_get_uniform(shd_outline, "in_Colour");
	shader_set_uniform_f(uni, vec4.r, vec4.g, vec4.b, vec4.a);
}
