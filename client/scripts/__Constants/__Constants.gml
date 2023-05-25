#macro default_font_char_width 12
#macro default_font_char_height 12

#macro default_draw_color c_white
#macro default_draw_alpha 1
#macro default_draw_font -4
#macro default_draw_halign fa_left
#macro default_draw_valign fa_top

#macro url_discord_ru "https://discord.gg/3GVTJWuPxa"
#macro url_discord_en "https://discord.gg/2Nuas5NKj8"
#macro url_gamejolt "https://gamejolt.com/games/underversebattles/647938"
#macro url_youtube "https://www.youtube.com/@UnderverseBattles"
#macro url_boosty "https://boosty.to/underverse_battles"

// The enum of all directions
// You can use it to create objects or rotate sprites
enum dir {
	right      = 0,
	right_up   = 45,
	up_right   = 45,
	up         = 90,
	up_left    = 135,
	left_up	   = 135,
	left       = 180,
	left_down  = 225,
	down_left  = 225,
	down       = 270,
	down_right = 315,
	right_down = 315,
}

// Android
#macro max_touches 4
