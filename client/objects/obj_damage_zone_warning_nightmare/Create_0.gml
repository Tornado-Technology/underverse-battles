depth = fight_depth.bullet;

image_alpha = 0;
image_alpha_target = 0.6;
image_alpha_amount = 0.5;

time_source_zone = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_damage_zone_nightmare, {
		nightmare_id: nightmare_id
	});
	instance.warning = id;
});
time_source_start(time_source_zone);