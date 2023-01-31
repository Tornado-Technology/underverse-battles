sprite_index = noone;
width = room_width; //display_get_gui_width();
heigth = room_height; //display_get_gui_height();

alpha = 0;
alpha_text = 0;

// Render
text = translate_get("AchievementGet");
text_progress = 0;

// Achivement
achievement = noone;

// Sprite border
sprite_border = spr_ui_achievement_border;
sprite_border_width = sprite_get_width(sprite_border);
sprite_border_height = sprite_get_height(sprite_border);

// Position
x = width + sprite_border_width;
y = sprite_border_height / 2;

// Scale
scale = max(1, string_length(text) * 8 / 110);