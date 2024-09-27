// Globals
global.__achievement_list = [];
global.__achievement_list_buffer = [];
#macro achievement_list_length array_length(global.__achievement_list)
#macro achievement_list_buffer array_length(global.__achievement_list_buffer)

Achievement("FirstEnemy", spr_achivement_first_kill);
Achievement("DefeatSans", spr_achivement_defeat_sans);
Achievement("DefeatError", spr_achivement_defeat_error_sans);
Achievement("DefeatInk", spr_achivement_defeat_ink_sans);
Achievement("Balance", spr_achivement_balance);
Achievement("DefeatXChara", spr_achivement_defeat_xchara);
Achievement("Link", spr_achivement_link);
Achievement("DefeatFellSans", spr_achivement_defeat_fell_sans);
Achievement("DefeatSwapSans", spr_achivement_defeat_swap_sans);
Achievement("DefeatSwapPapyrus", spr_achivement_defeat_swap_papyrus);
Achievement("ACybersWorld", spr_achivement_a_cybers_world);
Achievement("DefeatCross", spr_achivement_defeat_cross);
Achievement("DefeatGreen", spr_achivement_defeat_green);
Achievement("NoHit", spr_achivement_no_hit);
Achievement("Immortality", spr_achivement_immortality);
Achievement("DefeatDream", spr_achivement_defeat_dream);
Achievement("DefeatNightmare", spr_achivement_defeat_nightmare);
Achievement("DefeatPapyrus", spr_achivement_defeat_papyrus);
Achievement("DefeatXAnastasia", spr_achivement_defeat_xanastasia);
Achievement("DefeatJevil", spr_achivement_defeat_jevil);
Achievement("PotassiumOverdose", spr_achivement_potassium_overdose);

// Main loader
function achivements_load() {
	instance_create(obj_achievements);
	
	var data_achievements = data_get("Data.Achievements") == undefined ? [] : data_get("Data.Achievements");
	var data_achievements_length = array_length(data_achievements);
	
	for (var i = 0; i < achievement_list_length; i++) {
		if (i < data_achievements_length) {
			global.__achievement_list[i].is_taken = data_achievements[i];
			continue;
		}
		
		global.__achievement_list[i].is_taken = false;
	}
}

// All achivements indexes
enum achievement_id {
	first_kill,
	defeat_sans,
	defeat_error,
	defeat_ink,
	balance,
	defeat_xchara,
	link,
	defeat_fell,
	defeat_swap,
	defeat_swap_papyrus,
	a_cybers_world,
	defeat_cross,
	defeat_green,
	not_scratch,
	immortality,
	defeat_dream,
	defeat_nightmare,
	defeat_papyrus,
	defeat_xanastasia,
	defeat_jevil,
	potassium_overdose,
}
