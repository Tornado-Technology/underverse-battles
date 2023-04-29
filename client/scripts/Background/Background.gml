global.__backgrounds = []
    
// Background information types
enum background_info {
    sprite,
    name,
    description,
    author,
    au,
    au_id,
    animator,
	position1,
	position2
}

// Background index
enum _background {
    last_coridor,
	forest_park,
	winter_forest_park,
	deltarune_battle,
	queens_hall,
	doodle_sphere,
	undertale_battle,
	jevils_circus
}

// Custom backgrounds
Background(spr_background_last_coridor, _background.last_coridor, "Backgrounds.LastCoridor", "Tornado", universe.undertale);
Background(spr_background_underverse_forest, _background.forest_park, "Backgrounds.UnderverseForest", "Tornado", universe.underverse);
Background(spr_background_underverse_forest_winter, _background.winter_forest_park, "Backgrounds.WinterForestPark", "Tornado", universe.underverse);
Background(spr_background_deltarune_battle,	_background.deltarune_battle, "Backgrounds.DeltaruneBattle", "Marsilies", universe.deltarune, obj_background_deltarune);
Background(spr_background_queen_s_hall_background, _background.queens_hall, "Backgrounds.QueensHall", "Tornado", universe.deltarune, obj_background_queen_s_hall);
Background(spr_background_doodle_sphere, _background.doodle_sphere, "Backgrounds.DoodleSphere", "Tornado", universe.underverse, obj_background_doodle_sphere);
Background(spr_background_undertale_battle, _background.undertale_battle, "Backgrounds.UndertaleBattle", "Tornado", universe.undertale);
Background(spr_background_jevil, _background.jevils_circus, "Backgrounds.Jevil", "Tornado",	universe.deltarune, obj_background_jevils_circus);

/// @param {Real} info
/// @param {Real} index
function background_get(info, index) {
    var obj = global.__backgrounds[index] 
    
    switch(info) {
        default:
            return undefined;
        case background_info.sprite:
            return obj.sprite;
        case background_info.name:
            return obj.name;
        case background_info.description:
            return obj.description;
        case background_info.author:
            return obj.author;
        case background_info.au:
            return obj.au;
        case background_info.au_id:
            return obj.au_id;
        case background_info.animator:
            return obj.animator;
		case background_info.position1:
            return obj.position_1;
		case background_info.position2:
            return obj.position_2;
    }
}

function background_get_count() {
    return array_length(global.__backgrounds);
}

function backgrounds_translate_update() {
	var size = background_get_count();
	
	for (var bg = 0; bg < size; bg++) {
		global.__backgrounds[bg].translate_update();
	}
}

/// @param {Asset.GMSprite} sprite
/// @param {Real} index
/// @param {String} key
/// @param {String} author
/// @param {Real} au
/// @param {Asset.GMObject} animator
/// @param {Struct.ClassVector2} position_1
/// @param {Struct.ClassVector2} position_2
function Background(sprite, index, key, author, au, animator = noone, position_1 =  Vector2(80, 180), position_2 = Vector2(400, 180)) {
	var background = new BackgroundClass(sprite, key, author, au, animator, position_1, position_2);
	background.index = index;
	array_push(global.__backgrounds, background);
	return background;
}

/// @param {Asset.GMSprite} sprite
/// @param {String} key
/// @param {String} author
/// @param {Real} au
/// @param {Asset.GMObject} animator
/// @param {Struct.ClassVector2} position_1
/// @param {Struct.ClassVector2} position_2
function BackgroundClass(sprite, key, author, au, animator, position_1, position_2) constructor {
    self.sprite = sprite;
	self.key = key;
	self.author = author;
	self.au = au;
	self.animator = animator;
	self.position_1 = position_1;
	self.position_2 = position_2;
	
	index = 0;
	
	// Translate info
	name = "";
	description = "";
	
	static translate_update = function() {
		name = translate_get(key + ".Name");
		description = translate_get(key + ".Description");
	} 
};