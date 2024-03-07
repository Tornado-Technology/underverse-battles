global.__soundtrack_list = [];
#macro soundtrack_list []

/// @param {Asset.GMSound} snd
/// @param {String} name
/// @param {String} description
/// @param {String} author
/// @param {Real} au
function ClassSoundtrack(snd, name, description, author, au, stream, stream_path = "") constructor {
	self.source = snd;
	self.name = name; 
	self.author = author;
	self.description = description;
	self.au = au;
	
	self.index = 0;
	self.index_au = 0;
	
	self.stream_path = stream_path;
	self.stream = stream;
	
	static play = function(priority, loop) {
		if (stream) {
			source = audio_create_stream(stream_path);
			audio_play_sound(source, priority, loop);
			return;
		}
		
		audio_play_sound(source, priority, loop);
	}
	
	static stop = function() { 
		if (source == undefined) return;
		audio_stop_sound(source);
	
		if (stream) {
			audio_destroy_stream(source);
		}
	}
	
	static set_gain = function(volume, time) {
		if (source == undefined) return;
		audio_sound_gain(source, volume, time);
	}
} 

/// @desc Used to add new soundtracks to the game.
/// @param {Asset.GMSound} snd - Asset for playing the source
/// @param {String} name - NOT TRANSLATED source name, used to display in me and sort by name
/// @param {String} description - NOT A TRANSLATED short description
/// @param {String} author - NOT TRANSLATED author name to be shown in the menu and sorted by author
/// @param {Real} au - Belonging to an alternate universe, to sort by universe
/// @param {Bool} stream
/// @param {String} stream_path
/// @return {Struct.ClassSoundtrack} - A registered instance of the class
function Soundtrack(snd, name = "Name", author = "NotSeted", description = "Description", au = AU.EXAMPLE, stream = false, stream_path = "") {
	var source = new ClassSoundtrack(snd, name, description, author, au, stream, stream_path);
	source.index = soundtrack_get_count("all");
	source.index_au = soundtrack_get_count("au", au);
	array_push(soundtrack_list, source);
	return source;
}
