event_inherited();

damage = 0;
soul_invulnerability = 1;
destructible = false;
depth = fight_depth.bullet;

on_soul_touch = function(soul) {
	var	 hmv = (input_check_held(input.down) - input_check_held(input.up));
	var	 vmv = (input_check_held(input.right) - input_check_held(input.left)) ;
	
	
	if (hmv == 0 && vmv == 0) return;
	fight_soul_damage(damage, destructible, id);
}
