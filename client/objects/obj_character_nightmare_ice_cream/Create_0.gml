event_inherited();

frame = spr_nightmare_ice_cream_frame;

idle_animation = spr_ngihtmare_ice_cream_idle;
after_battle_animation = spr_ngihtmare_ice_cream_after_battle;
defeated_animation = spr_nightmaer_ice_cream_defeated;
defeated_animation_last_image = spr_nightmare_ice_cream_defeated_last_image;

fight_1_start_animation = spr_ngihtmare_ice_cream_tentacles_start;
fight_1_idle_animation = spr_nightmaer_ice_cream_tentacles_idle;
fight_1_finish_animation = spr_ngihtmare_ice_cream_tentacles_finish;



actions = [
	Action("Character.Nightmare.Attack0", call_attack_nightmare_ice_cream_0),
	Action("Character.Nightmare.Attack1", call_attack_nightmare_ice_cream_1),
	Action("Character.Nightmare.Attack2", call_attack_nightmare_ice_cream_2)
];