on_into_story_mode.invoke("Tutorial");



// Characters (add characters here)


// Props (add objects here)


// Soul (add souls here)


// Data (add data here)


// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Particles (add data here)


// Time sources (add data here)

// Methods (add methods here)
cutscene_set = function (index) {
	cutscene_create(cutscenes[index]);
}

// Cutscenes
cutscenes = [
	[	// Your first cutscene
		[dialog_create, "Underverse_Episode1.Dialog4"]
	]
];