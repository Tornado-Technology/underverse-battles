on_into_story_mode.invoke("Tutorial");

episode = "Underverse_Episode3.";

// Fight
fight = obj_fight_underverse_episode2;

// Characters
frisk = obj_
sans = obj_character_sans;
papyrus = obj_character_papyrus;

// Stuff

// Soul
soul_sans_half = noone;

// Data

// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Time sources
time_source_restart = time_source_create(time_source_game, 5, time_source_units_seconds, function() {
	cutscene_set(0);
});

// Methods
cutscene_set = function (index) {
	cutscene_create(cutscenes[index]);
}

cutscene_after_death = function () {
	effect_blackout_start(c_black, false, fight_depth.ui);
	
	instance_destroy(obj_cutscene);
	instance_destroy(ink_sans);
	instance_destroy(cross);
	instance_destroy(error_sans);
	instance_destroy_array(string_cross);
	instance_create(obj_soul_destroyed);
	time_source_start(time_source_restart);
}

// Cutscenes
cutscenes = [
	[	// Picnic begins (Index: 0)
		instance_c
	]
];