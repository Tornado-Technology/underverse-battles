function fight_random_park_miller() {
	var m = 4294967311;
	var a = sqrt(global.max_seed);
	global.seed = a * global.seed mod m;
}