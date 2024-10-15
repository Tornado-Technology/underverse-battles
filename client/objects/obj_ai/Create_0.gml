sprite_index = noone;

max_power = 4;

result = -1;
result_power = -1;
_hits = 0;
_damage = 0;

delay_extra = 0;
period_min = 60;
period = period_min;

is_select_special_attack = true;

change_period = function () {
	period = irandom_range(period_min, period_min * 4);
	delay_extra = 0;
}
change_period();