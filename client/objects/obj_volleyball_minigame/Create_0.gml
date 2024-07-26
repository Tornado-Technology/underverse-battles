score_team_1 = 0;
score_team_2 = 0;
last_puncher = noone;

text_team_1 = translate_get("MiniGame.PapyrussTeam");
text_team_2 = translate_get("MiniGame.UndynesTeam");

on_round_start = new Event();
on_fall_ball = new Event();
stop_all_players = new Event();

papyrus = instance_create_depth(x + 40, y + 80, fight_depth.player, obj_volleyball_character_papyrus);
papyrus.start_position_x = x + 40;
papyrus.start_position_y = y + 80;
frisk = instance_create_depth(x + 118, y + 80, fight_depth.player, obj_volleyball_character_frisk);
frisk.start_position_x = x + 118;
frisk.start_position_y = y + 80;
sans = instance_create_depth(x + 80, y + 32, fight_depth.player, obj_volleyball_character_sans);
sans.start_position_x = x + 80;
sans.start_position_y = y + 32;
asgore = instance_create_depth(x + 40, y + 192, fight_depth.player, obj_volleyball_character_asgore);
asgore.start_position_x = x + 40;
asgore.start_position_y = y + 192;
alphys = instance_create_depth(x + 118, y + 192, fight_depth.player, obj_volleyball_character_alphys);
alphys.start_position_x = x + 118;
alphys.start_position_y = y + 192;
undyne = instance_create_depth(x + 80, y + 208, fight_depth.player, obj_volleyball_character_undyne);
undyne.start_position_x = x + 80;
undyne.start_position_y = y + 208;

team_1_players = [papyrus, frisk, sans];
team_2_players = [asgore, alphys, undyne];
first_puncher_index_team_1 = 0;
first_puncher_index_team_2 = 0;
first_puncher = papyrus;

ball = noone;

first_out_was = false;
alphys_was_failed = false;
waiting_player_punch = false;

on_fall_ball.connect(function() {
	if (ball.x > x && ball.x < x + 160 && ball.y > y && ball.y <= y + 120) {
		team_2_goal();
		return;
	}
	if (ball.x > x && ball.x < x + 160 && ball.y > y + 120 && ball.y < y + 240) {
		if (last_puncher == alphys && !alphys_was_failed) {
			team_2_out(true);
			alphys_was_failed = true;
			return;
		}
		team_1_goal();
		return;
	}
	if (array_any(team_1_players, function (player) { return player == last_puncher; })) {
		team_1_out();
		return;
	}
	if (array_any(team_2_players, function (player) { return player == last_puncher; })) {
		if (last_puncher == alphys && !alphys_was_failed) {
			team_2_out(true);
			alphys_was_failed = true;
			return;
		}
		team_2_out();
		return;
	}
});

set_new_round = function(team_index) {
	
	array_foreach(team_1_players, function(player) {
		player.x = player.start_position_x;
		player.y = player.start_position_y;
	});
	array_foreach(team_2_players, function(player) {
		player.x = player.start_position_x;
		player.y = player.start_position_y;
	});
	
	if (score_team_1 == 9 || score_team_2 == 9) {
		instance_destroy(ball);
		instance_destroy(obj_cutscene);
		gameplay_underverse_episode_3_surface.create_final_volleyball_cutscene();
		instance_destroy();
		return;
	}
	
	if (team_index == 1 && score_team_1 > 0) {
		first_puncher_index_team_1++;
		if (first_puncher_index_team_1 >= array_length(team_1_players)) {
			first_puncher_index_team_1 = 0;
		}
		first_puncher = team_1_players[first_puncher_index_team_1];
	}
	if (team_index == 2 && score_team_2 > 0) {
		first_puncher_index_team_2++;
		if (first_puncher_index_team_2 >= array_length(team_2_players)) {
			first_puncher_index_team_2 = 0;
		}
		first_puncher = team_2_players[first_puncher_index_team_2];
	}
			
	instance_destroy(ball);
	
	ball = instance_create_depth(first_puncher.x, first_puncher.y + (team_index == 1 ? 1 : -1), fight_depth.player, obj_volleyball_ball);
	ball.height = first_puncher.ball_spawn_height;
	first_puncher.stand();
}
set_new_round(1);

team_1_goal = function() {
	var cutscene = [
		[cutscene_wait, 1],
		[cutscene_dialog, function() {
			if (last_puncher == papyrus && !papyrus.is_scored_ball) {
				papyrus.is_scored_ball = true;
				return "Underverse_Episode3.PapyrusGoal_1";
			}
			if (last_puncher == sans && !sans.is_scored_ball) {
				sans.is_scored_ball = true;
				return "Underverse_Episode3.SansGoal";
			}
			if (last_puncher == frisk && !frisk.is_scored_ball) {
				frisk.is_scored_ball = true;
				return "Underverse_Episode3.FriskGoal";
			}
			return "Underverse_Episode3.PapyrusGoal_2";
		}(), dir.down],
		[effect_fade, 0.5, 0.5, 0.5, c_black],
		[cutscene_wait, 1],
		[cutscene_execute, function() {
			score_team_1++;
			set_new_round(1);
		}],
		[cutscene_wait, 0.5],
		[cutscene_execute, function() {
			if (first_puncher == frisk) {
				waiting_player_punch = true;
				return;
			}
			on_round_start.invoke();
		}]
	];
	
	cutscene_create(cutscene);
}

team_2_goal = function() {
	var cutscene = [
		[cutscene_wait, 1],
		[cutscene_dialog, function() {
			if (last_puncher == asgore && !asgore.is_scored_ball) {
				asgore.is_scored_ball = true;
				return "Underverse_Episode3.AsgoreGoal";
			}
			if (last_puncher == alphys && !alphys.is_scored_ball) {
				alphys.is_scored_ball = true;
				return "Underverse_Episode3.AlphysGoal";
			}
			if (last_puncher == undyne && !undyne.is_scored_ball) {
				undyne.is_scored_ball = true;
				return "Underverse_Episode3.UndyneGoal_1";
			}
			return "Underverse_Episode3.UndyneGoal_2";
		}(), dir.up],
		[effect_fade, 0.5, 0.5, 0.5, c_black],
		[cutscene_wait, 1],
		[cutscene_execute, function() {
			score_team_2++;
			set_new_round(2);
		}],
		[cutscene_wait, 0.5],
		[cutscene_execute, function() {
			on_round_start.invoke();
		}]
	];
	
	cutscene_create(cutscene);
}

team_1_out = function() {
	var cutscene = [
		[cutscene_wait, 1],
		[cutscene_dialog, function() {
			if (!first_out_was) {
				first_out_was = true;
				return "Underverse_Episode3.UndyneOut_1";
			}
			return "Underverse_Episode3.UndyneOut_2";
		}(), dir.up],
		[effect_fade, 0.5, 0.5, 0.5, c_black],
		[cutscene_wait, 1],
		[cutscene_execute, function() {
			score_team_2++;
			set_new_round(2);
		}],
		[cutscene_wait, 0.5],
		[cutscene_execute, function() {
			on_round_start.invoke();
		}]
	];
	
	cutscene_create(cutscene);
}

team_2_out = function(is_alphys_fail = false) {
	var cutscene = [
		[cutscene_wait, 1],
		[cutscene_dialog, is_alphys_fail ? "Underverse_Episode3.AlphysLose" : "Underverse_Episode3.PapyrusOut",
			is_alphys_fail ? dir.up : dir.down],
		[effect_fade, 0.5, 0.5, 0.5, c_black],
		[cutscene_wait, 1],
		[cutscene_execute, function() {
			score_team_1++;
			set_new_round(1);
		}],
		[cutscene_wait, 0.5],
		[cutscene_execute, function() {
			if (first_puncher == frisk) {
				waiting_player_punch = true;
				return;
			}
			on_round_start.invoke();
		}]
	];
	
	cutscene_create(cutscene);
}