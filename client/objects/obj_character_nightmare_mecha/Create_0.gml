event_inherited();

frame = spr_nightmare_mecha_frame;


idle_animation = spr_nightmare_mecha_idle;
after_battle_animation = spr_nightmare_mecha_after_battle;
defeated_animation = spr_nightmare_mecha_defeated;
defeated_animation_last_image = spr_nightmare_mecha_defeated_last_image;

fight_1_start_animation = spr_nightmare_mecha_tentacles_start;
fight_1_idle_animation = spr_nightmare_mecha_tentacles_idle;
fight_1_finish_animation = spr_nightmare_mecha_tentacles_finish;

special_attack_start_animation = spr_nightmare_mecha_idle;
special_attack_idle_animation = spr_nightmare_mecha_idle;
special_attack_finish_animation = spr_nightmare_mecha_idle;

actions = [
	Action("Character.Nightmare.Attack0",  call_attack_nightmare_mecha_0),
	Action("Character.Nightmare.Attack1",  call_attack_nightmare_mecha_1),
	Action("Character.Nightmare.Attack2", call_attack_nightmare_mecha_2)
];