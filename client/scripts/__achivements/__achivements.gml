// Globals
global.__achievement_list = [];
global.__achievement_list_buffer = [];
#macro achievement_list_length array_length(global.__achievement_list)
#macro achievement_list_buffer array_length(global.__achievement_list_buffer)

Achievement("FirstEnemy", spr_achivement_firstkill);
Achievement("DefeatSans", spr_achivement_defeatsans);
Achievement("DefeatError", spr_achivement_defeaterror);
Achievement("DefeatInk", spr_achivement_defeatink);
Achievement("Balance", spr_achivement_balance);
Achievement("DefeatXChara", spr_achivement_defeatxchara);
Achievement("Link", spr_achivement_link);
Achievement("DefeatFellSans", spr_achivement_defeatfellsans);
Achievement("DefeatSwapSans", spr_achivement_defeatswapsans);
Achievement("DefeatSwapPapyrus", spr_achivement_defeatswappapyrus);
Achievement("ACybersWorld", spr_achivement_a_cybers_world);

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
	a_cybers_world
}
