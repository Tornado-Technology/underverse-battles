/// @desc Damage zone
_time++;

_power = (_power == 4) ? 5 : _power;

_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left - 30, battle_border.right - 30);
if (battle_border_start_animation_end()) exit;

_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

var period = 18 - _power * 2;
var amount = 15 + _power * 5;
if (_time % period == 1 && _time < period * amount) {
	var random_position = Vector2(irandom_range(_border.x - _border.up + 10, _border.x + _border.down - 10), irandom_range(_border.y - _border.left + 10, _border.y + _border.right - 10));
	instance_create_depth(random_position.x, random_position.y, fight_depth.bullet_outside, obj_damage_zone_warning_xchara);
}
		
if (_time >= period * amount + 60) {
	instance_destroy();
}
