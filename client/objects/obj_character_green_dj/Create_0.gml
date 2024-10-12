event_inherited();

// Skins
skin_name = translate_get("CharactersStyles.CodeHacker");
frame = spr_green_dj_frame;

// Animations
idle_animation = spr_green_dj_idle;
after_battle_animation =  spr_green_dj_idle;
defeated_animation =  spr_green_dj_defeated;
start1_animation = spr_green_dj_strings_start;
fight1_animation = spr_green_dj_strings_idle;
end1_animation = spr_green_dj_strings_finish;
defeated_last_image =  spr_green_dj_defeated_last_image;

actions = [
	Action("Character.Green.Attack0", green_attack0),
	Action("Character.Green.Attack1", green_dj_attack1),
	Action("Character.Green.Attack2", green_dj_attack2)
];