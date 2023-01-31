/// @desc Clean-Up
if (is_mobile) exit;
discord_instance = noone;
on_into_menu.disconnect(into_menu_handler);
on_into_fight.disconnect(into_fight_handler);
on_into_story_mode.disconnect(into_story_mode_handler);
