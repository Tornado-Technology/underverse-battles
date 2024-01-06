// Arguments blades

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	var radius = 90 - _power * 10;
	var _lengthdir_x = lengthdir_x(radius, soul_instance.x);
	var _lengthdir_y = lengthdir_y(radius, soul_instance.y);
	
	var _blades = instance_create_depth(soul_instance.x - _lengthdir_x, soul_instance.y + _lengthdir_y, fight_depth.bullet_outside, blades);
	_blades.direction = point_direction(_blades.x, _blades.y, soul_instance.x, soul_instance.y);
	_blades.image_angle = direction;
	
};

var period =  30 - _power * 2;
var reteats = period + _power;

time_source_update = time_source_create(time_source_game, period, time_source_units_seconds, function () {
	update();
});

time_source_update_destroy = time_source_create(time_source_game, reteats , time_source_units_seconds, function (){
	instance_destroy();	
});