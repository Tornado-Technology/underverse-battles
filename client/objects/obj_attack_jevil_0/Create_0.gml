event_inherited();

on_border_created = function() {
	pattern_instance.callback();
}

switch(type) {
	default:
	create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right );
	pattern_instance = create_pattern(obj_pattern_box);
	break;
	
	
	

}