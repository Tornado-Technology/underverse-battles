sprite_index = noone;
depth = -1000;

enum menu_page { 
	// Main group
	main, 
	singleplayer,
	storymode,
	multiplayer,
	signup,
	login,
	password_retrieval,
	characters, 
	achivments,
	credits,
	modifications,
	
	// Account
	multiplayer_account,
	statistics,
	account_settings,
    account_change_nickname,
    account_change_password,
    account_change_email,
	
	// Setings group
	settings,
	settings_main,
	settings_audio,
	settings_input,
	settings_shaders,
	settings_data,
	settings_beta,
	settings_fight,
	
	// Debug group
	debug_rooms
}

width = display_get_gui_width();
height = display_get_gui_height();
game_hash = client_info.hash;

// Effect fade
effect_fade(0, 2, c_white, c_white, true, 0);

// Logo
logo = spr_underverse_battles_logo;
is_logo_open = true;
is_make_logo_open = false;
logo_y = height / 8 - 80;
logo_x = width  / 2;
logo_start_y  = height / 8 - 20;
logo_target_y = height / 8 - 80;
logo_alpha = 0;

// Title
title_text = "";
show_title = false;

// Opening theme
enum opening_theme {
	tangled,
	alternation
}

opening = choose(opening_theme.tangled, opening_theme.alternation);

// Background
background = opening == opening_theme.tangled ? spr_background_tangled : spr_background_alternation;
background_height = opening == opening_theme.tangled ? sprite_get_height(background) * 2 : sprite_get_height(background);
background_width = sprite_get_width(background);

background_color_main = opening_theme.tangled ? c_white : background_color;

background_alpha = 1;
background_target_alpha = 1;

background_target_y = -background_height + height;
background_y = 0;

// Background frame animation

image_frame = 0;
time_source_start(time_source_create(time_source_game, 0.2, time_source_units_seconds, function() {
	image_frame++;
}, [], -1));

// Anykey text
anykey_y = height - height / 8;
anykey_start_y = anykey_y;
anykey_target_y = anykey_y + 40;
anykey_show = true;
anykey_alpha = 1;

anykey_text = new Text()
	.set_text(translate_get("Menu.PressAnyKey"))
	.set_color(c_white)
	.set_outline(c_black);

// Blackout
blackout_alpha = 0;
blackout_taget_alpha = 0.7;
is_blackout = false;
is_make_blackout = false;

// Audio
menu_soundtrack_current = opening == opening_theme.tangled ? snd_tangled : snd_alternation;
audio_stop_all();

time_source_menu_soundtrack = time_source_create(time_source_game, 1, time_source_units_seconds, function() {
	audio_play_sound(menu_soundtrack_current, 2, true, 0.5);
});
time_source_start(time_source_menu_soundtrack);

elements_show = false;
pause = false;
titles = [];
title_switches = [];
pages = [];
page_index = -1;
page_width = 0;
page_height = 0;
page_start_x = 0;
page_element_offset = 18;
page_x = 0;
page_y = 0;
input_is_locked = false;

elements_count = 0;
element_index = -1;
element_mouse_index = -1;

on_goto_page = function() {};
on_goto_page_event = new Event();

create_page = function(elements, position = array_length(pages) - 1, translate_key = "", title_switch = false) {
	titles[position] = "Menu." + translate_key;
	title_switches[position] = title_switch;
	pages[position] = elements;
	
	// set index
	for (var i = 0; i < array_length(pages[position]); i++) {
		pages[position][i].index = i;
	}
}

page_insert = function(page, index, element) {
	array_insert(get_page(page), index, element);
	
	// set index
	for (var i = 0; i < array_length(get_page(page)); i++) {
		pages[page][i].index = i;
	}
}

goto_page = function(index) {
	unfocus_current_element();
	page_index = index;
	
	title_text = titles[index];
	show_title = title_switches[index];
	
	elements_count = array_length(pages[index]);
	page_width = get_page_width();
	page_height = get_page_height();
	
	input_e = 0;
	
	element_mouse_index = -1;
	element_index = -1;
	
	on_goto_page();
	on_goto_page_event.invoke();
}

get_current_page = function() {
	return pages[page_index];
}

get_page = function(index) {
	return pages[index];
}

pages_foreach = function(callback) {
	for (var i = 0; i < array_length(pages); i++) {
		callback(get_page(i));
	}	
}

get_page_width = function() {
	max_width = 0;
	
	for (var i = 0; i < elements_count; i++) {
		max_width = max(max_width, get_element_in_page(i).text_width);
	}
	
	return max_width;
}

get_page_height = function() {
	new_page_height = 0;
	
	for (var i = 0; i < elements_count; i++) {
		new_page_height = get_element_in_page(i).text_height + page_element_offset * i;
	}

	
	return new_page_height;
}

change_element_mouse = function(index) {
	if (input_is_locked) return;
	
	if (index == -1) {
		element_mouse_index = -1;
		return;
	}
	
	if (element_index >= 0 && element_index != elements_count) {
		get_element_in_page(element_index).unfocus();
	}
	
	element_index = index;
	element_mouse_index = index;
	
	get_current_element_in_page().focus();
}

unfocus_current_element = function() {
	if (element_index < 0 || element_index >= elements_count) return;
	get_element_in_page(element_index).unfocus();
}

get_current_element_in_page = function() {
	return pages[page_index][element_index];
}

get_element_in_page = function(index) {
	return pages[page_index][index];
}

elements_foreach = function(callback) {
	for (var i = 0; i < elements_count; i++) {
		callback(get_element_in_page(i));
	}
}

on_change_element = function() {
	if (element_mouse_index != -1) return;
	
	var previous_element = element_index;
	
	element_index += input_v;
	
	if (element_index == elements_count) {
		element_index = 0;
	}
	
	if (element_index < 0) {
		element_index = elements_count - 1;
	}
	
	if (previous_element >= 0 && previous_element != elements_count) {
		get_element_in_page(previous_element).unfocus();
	}
	get_current_element_in_page().focus();
}

login_callback = on_network_login.connect(function() {
	if (!instance_exists(id)) return;
	if (id.pause) return;
	if (page_index >= menu_page.multiplayer && page_index <= menu_page.login) {
		goto_page(menu_page.multiplayer_account);
	}
});

disconnect_callback = on_network_disconnect.connect(function() {
	if (page_index >= menu_page.multiplayer_account && page_index <= menu_page.account_change_email) {
		goto_page(menu_page.multiplayer);
		instance_destroy(obj_profile_statistics);
	}
});

Execute = MenuExecute;
Transfer = MenuTransfer;
Shift = MenuShift;
Toggle = MenuToggle;
Slider = MenuSlider;
InputBox = MenuInputBox;

input_e = 0;
input_v = 0;
input_h = 0;
input_wheel = 0;
held_h  = 0;

// Menu
if (!development_mode) {
	create_page([
		Transfer("Main.SingleBattle", menu_page.singleplayer),
		Transfer("Main.Multiplayer", menu_page.multiplayer, function() {
			menu_successful_login(self);
		}),
		Execute("Main.Characters", [], function () {
			instance_create_one(obj_characters);
		}),
		Transfer("Main.Achievements", menu_page.achivments, function() {
			instance_create(obj_menu_achivements);
		}),
		Transfer("Main.Settings", menu_page.settings),
		Transfer("Main.Credits", menu_page.credits, function() {
			instance_create_one(obj_credits);
		}),
		Execute("Main.Exit", [], function() {
			game_end();
		}),
	], menu_page.main);
} else {
// Menu (development mode)
create_page([
	Transfer("Main.SingleBattle", menu_page.singleplayer),
	Transfer("Main.Multiplayer", menu_page.multiplayer, function() {
		menu_successful_login(self);
	}),
	Execute("Main.Characters", [], function () {
		instance_create_one(obj_characters);
	}),
	Transfer("Main.Achievements", menu_page.achivments, function() {
		instance_create(obj_menu_achivements);
	}),
	Transfer("Main.Settings", menu_page.settings),
	Execute("Main.DebugRooms", [], function() {
		room_goto(room_cutscene_test);
	}),
	Transfer("Main.Credits", menu_page.credits, function() {
		instance_create_one(obj_credits);
	}),
	Execute("Main.Exit", [], function() {
		game_end();
	}),
], menu_page.main);
}
// Debug rooms
create_page([
	Execute("CutsceneTest", [], function() {
		room_goto(room_underverse_episode2);
	}),
	Execute("UITest", [], function() {
		room_goto(room_ui_test);
	}),
	Transfer("StandardButtons.Back", menu_page.main),
], menu_page.debug_rooms, "Main.DebugRooms", true);

// SingleBattle
create_page([
	Transfer("SingleBattle.StoryMode", menu_page.storymode),
	Execute("SingleBattle.CustomBattle", [], function() {
		instance_create(obj_menu_custom_battle_characters);
	}),
	Execute("SingleBattle.SelectBackground", [], function() {
		instance_create(obj_background_selection);
	}),
	Execute("SingleBattle.CustomSound", [], function() {
		instance_create(obj_soundtrack_selection);
	}),
	Execute("SingleBattle.MiniGame", [], function() {
		room_goto(room_get_banana);
	}),
	Transfer("StandardButtons.Back", menu_page.main),
], menu_page.singleplayer, "SingleBattle.Title", true);

// Story Mode
create_page([
	Execute("StoryMode.Episode1", [], function() {
		room_goto(room_story_mode);
	}),
	Execute("StoryMode.Episode2", [], function() {
		room_goto(room_underverse_episode2);
	}),
	Transfer("StandardButtons.Back", menu_page.singleplayer),
], menu_page.storymode, "StoryMode.Title", true);

// Multiplayer
create_page([
	Transfer("Multiplayer.SignUp", menu_page.signup, function() {
		instance_create(obj_menu_sign_up, {
			inputbox_login: sign_inputbox_login.input_box,
			inputbox_password: sign_inputbox_password.input_box,
			inputbox_confirm_password: sign_inputbox_confirm_password.input_box,
			inputbox_email: sign_inputbox_email.input_box,
		});
	}),
	Transfer("Multiplayer.LogIn", menu_page.login, function() {
		instance_create(obj_menu_log_in, {
			inputbox_login: login_inputbox_login.input_box,
			inputbox_password: login_inputbox_password.input_box,
		});
	}),
	Transfer("Multiplayer.RestorePassword", menu_page.password_retrieval),
	Execute("Multiplayer.Reconnect", [], function() {
		button_reconnect();
	}),
	Transfer("StandardButtons.Back", menu_page.main),
], menu_page.multiplayer, "Multiplayer.Title", true);

sign_inputbox_login = InputBox("SignUp.WriteLogin");
sign_inputbox_password = InputBox("SignUp.WritePassword", false);
sign_inputbox_confirm_password = InputBox("SignUp.ConfirmPassword", false);
sign_inputbox_email = InputBox("SignUp.WriteEmail");

// Sign Up
create_page([
	sign_inputbox_login,
	sign_inputbox_password,
	sign_inputbox_confirm_password,
	sign_inputbox_email,
	Execute("StandardButtons.Apply", [], function() {
		sign_up_apply();
	}),
	Transfer("StandardButtons.Back", menu_page.multiplayer, function() {
		instance_destroy(obj_menu_sign_up);
	}),
], menu_page.signup, "SignUp.Title", true);

login_inputbox_login = InputBox("LogIn.WriteLogin");
login_inputbox_password = InputBox("LogIn.WritePassword", false);

// Login
create_page([
	login_inputbox_login,
	login_inputbox_password,
	Execute("StandardButtons.Apply", [], function() {
		log_in_apply();
	}),
	Transfer("StandardButtons.Back", menu_page.multiplayer, function() {
		instance_destroy(obj_menu_log_in);
	}),
], menu_page.login, "LogIn.Title", true);

// Forgot password
password_retrieval_inputbox_change_nickname = InputBox("PasswordRetrieval.WriteLogin");
password_retrieval_inputbox_change_password = InputBox("PasswordRetrieval.WritePassword", false);

create_page([
    password_retrieval_inputbox_change_nickname,
	password_retrieval_inputbox_change_password,
	Execute("StandardButtons.Apply", [], function() {
		var nickname = password_retrieval_inputbox_change_nickname.input_box.text;
		var password = password_retrieval_inputbox_change_password.input_box.text;
		send_password_retrieval(nickname, password);
	}),
    Transfer("StandardButtons.Back", menu_page.multiplayer),
], menu_page.password_retrieval, "PasswordRetrieval.Title", true);

// Multiplayer Account
create_page([
	Execute("Multiplayer.Battle1v1", [], function() {
		instance_create(obj_menu_multiplayer_characters);
	}),
	Execute("SingleBattle.SelectBackground", [], function() {
		instance_create(obj_background_selection);
	}),
	Execute("SingleBattle.CustomSound", [], function() {
		instance_create(obj_soundtrack_selection);
	}),
	Transfer("Multiplayer.Statistics", menu_page.statistics, function() {
		instance_create(obj_profile_statistics);
	}),
	Transfer("Multiplayer.AccountOptions", menu_page.account_settings),
	Transfer("Multiplayer.LogOut", menu_page.multiplayer, function() {
		send_logout();
	}),
	Transfer("StandardButtons.Back", menu_page.main),
], menu_page.multiplayer_account, "Multiplayer.Title", true);

// Statistics
create_page([
	Transfer("StandardButtons.Back", menu_page.multiplayer_account, function() {
		instance_destroy(obj_profile_statistics);
	}),
], menu_page.statistics, "Statistics.Title", true);

// Account settings
account_settings_inputbox_change_nickname = InputBox("AccountOptions.ChangeNickname");
account_settings_inputbox_change_password = InputBox("AccountOptions.ChangePassword", false);
account_settings_inputbox_change_email = InputBox("AccountOptions.ChangeEmail");

create_page([
    Transfer("AccountOptions.ChangeNickname", menu_page.account_change_nickname),
    Transfer("AccountOptions.ChangePassword", menu_page.account_change_password),
    Transfer("AccountOptions.ChangeEmail", menu_page.account_change_email),
    Execute("AccountOptions.DeleteAccount", menu_page.account_settings, function() {
		send_delete_account();
	}),
    Transfer("StandardButtons.Back", menu_page.multiplayer_account),
], menu_page.account_settings, "AccountOptions.Title", true);

// Account change nickname
create_page([
    account_settings_inputbox_change_nickname,
	Execute("StandardButtons.Apply", [], function() {		
		send_nickname_change(account_settings_inputbox_change_nickname.input_box.text);
	}),
    Transfer("StandardButtons.Back", menu_page.account_settings),
], menu_page.account_change_nickname, "AccountOptions.ChangeNickname", true);

// Account change password
create_page([
    account_settings_inputbox_change_password,
	Execute("StandardButtons.Apply", [], function() {
		send_password_change(account_settings_inputbox_change_password.input_box.text);
	}),
    Transfer("StandardButtons.Back", menu_page.account_settings),
], menu_page.account_change_password, "AccountOptions.ChangePassword", true);

// Account change email
create_page([
    account_settings_inputbox_change_email,
	Execute("StandardButtons.Apply", [], function() {
		send_eamil_change(account_settings_inputbox_change_email.input_box.text);
	}),
    Transfer("StandardButtons.Back", menu_page.account_settings),
], menu_page.account_change_email, "AccountOptions.ChangeEmail", true);

// Achievements
create_page([
	Transfer("StandardButtons.Back", menu_page.main, function() {
		instance_destroy(obj_menu_achivements);
	})
], menu_page.achivments, "Main.Achievements", true);

// Settings 
create_page([
	Transfer("Settings.Main", menu_page.settings_main),
	Transfer("Settings.Sound", menu_page.settings_audio),
	Transfer("Settings.Control", menu_page.settings_input),
	Transfer("Settings.Data.Title", menu_page.settings_data),
	Transfer("StandardButtons.Back", menu_page.main),
], menu_page.settings, "Settings.Title", true);

// Settings main
var langs = [];

for (var i = 0; i < array_length(global._translate_langs); i++) {
	var root = global._translate_langs[i];
	var info = json_open(translate_directory + root + "/" + translate_language_info);
	array_push(langs, info.name);
}

create_page([
	Shift("Settings.Language", langs, global.__translate_lang_id, function(index) {
		translate_set_lang(index);
	}),
	Shift("Settings.DisplayFPS", ["No", "FPS", "RFPS", "FPS + RFPS"], data_get("Settings.UI.FpsStyle"), function(value) {
		data_set("Settings.UI.FpsStyle", value);
	}),
	Toggle("Settings.DisplayPing", data_get("Settings.UI.PingStyle"), function(value) {
		data_set("Settings.UI.PingStyle", value);
	}),
	Slider("Settings.HUDTransparence", data_get("Settings.UI.Fight.StatbarStyle"), function(alpha) {
		data_set("Settings.UI.Fight.StatbarStyle", alpha);
	}),
	Toggle("Settings.ShowUsage", data_get("Settings.UI.Fight.ShowUsage"), function(value) {
		data_set("Settings.UI.Fight.ShowUsage", value);
	}),
	Transfer("StandardButtons.Back", menu_page.settings),
], menu_page.settings_main, "Settings.Title", true);

if (is_desktop) {
	page_insert(menu_page.settings_main, 0, Toggle("Settings.Fullscreen", window_get_fullscreen(), function(value) {
		window_set_fullscreen(value);
	}));
}

// Settings audio
create_page([
	Slider("Settings.MenuMusicVolume", data_get("Settings.Gain.MenuMusic"), function(gain) {
		data_set("Settings.Gain.MenuMusic", gain);
		audio_group_set_gain(menu_music, gain, 0);
	}),
	Slider("Settings.MusicVolume", data_get("Settings.Gain.Music"), function(gain) {
		data_set("Settings.Gain.Music", gain);
		audio_group_set_gain(music, gain, 0);
	}),
	Slider("Settings.SoundVolume", data_get("Settings.Gain.Sound"), function(gain) {
		data_set("Settings.Gain.Sound", gain);
		audio_group_set_gain(sound, gain, 0);
	}),
	Transfer("StandardButtons.Back", menu_page.settings),
], menu_page.settings_audio, "Settings.Title", true);

// Settings input
if (is_desktop && !mobile_mode) {
	create_page([
		MenuInput("Control.Up", input.up),
		MenuInput("Control.Down", input.down),
		MenuInput("Control.Left", input.left),
		MenuInput("Control.Right", input.right),
		MenuInput("Control.Action", input.action),
		MenuInput("Control.Skip", input.skip),
		Execute("Control.Default", [], function() {
			data_reset_controls();
			audio_play_sound_once(snd_selection);
		}),
		Transfer("StandardButtons.Back", menu_page.settings),
	], menu_page.settings_input, "Settings.Title", true);
}

if (is_mobile || mobile_mode) {
	create_page([
		Execute("Settings.MobileControl", [], function() {
			room_goto(room_setting_joystick);
		}),
		Transfer("StandardButtons.Back", menu_page.settings),
	], menu_page.settings_input);
}

// Settings data
create_page([
	Toggle("Settings.Data.Autolog", data_get("Settings.Data.Autolog"), function(value) {
		data_set("Settings.Data.Autolog", value);
	}),
	Toggle("Settings.Data.Save.Soundtrack", data_get("Settings.Data.SaveSoundtrack"), function(value) {
		data_set("Settings.Data.SaveSoundtrack", value);
	}),
	Toggle("Settings.Data.Save.Background", data_get("Settings.Data.SaveBackground"), function(value) {
		data_set("Settings.Data.SaveBackground", value);
	}),
	Execute("Settings.Data.Reset.All", [], function() {
		data_reset();
	}),
	Execute("Settings.Data.Reset.Achivments", [], function() {
		data_reset_achievements();
	}),
	Execute("Settings.Data.Reset.Settings", [], function() {
		data_reset_settings();
	}),
	Transfer("StandardButtons.Back", menu_page.settings),
], menu_page.settings_data, "Settings.Title", true);

// Modifications
create_page([
	Transfer("StandardButtons.Back", menu_page.main),
], menu_page.modifications);

// Credits
create_page([
	Transfer("StandardButtons.Back", menu_page.main, function() {
		instance_destroy(obj_credits);
	}),
], menu_page.credits);

goto_page(menu_page.main);

page_target_x = 10;
page_start_x = -page_width - 32;
page_x = page_start_x;
page_y = (height / 2 + 30) - page_height / 2;

on_goto_page = function() {
	page_y = (height / 2 + 30) - page_height / 2;
}

translate_update = on_translate_update.connect(function() {
	anykey_text = translate_get("Menu.PressAnyKey");
	
	//title_text.translate_update();
	
	pages_foreach(function(page) {
		for (var i = 0; i < array_length(page); i++) {
			page[i].translate_update();
			page_width = get_page_width();
		}
	})
});
