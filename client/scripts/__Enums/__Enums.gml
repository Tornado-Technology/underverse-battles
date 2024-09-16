enum skin_content {
	name,
	descritption,
	cost,
	sprites,
	soundtrack
}

enum universe {
	no,
	hiden,
	example,
	undertale,
	deltarune,
	underfell,
	flowerfell,
	abysstale,
	poketale,
	dreamtale,
	fellswap,
	swapfell,
	dusttale,
	oceantale,
	altertale,
	aftertale,
	dancetale,
	xtale,
	underverse,
	outertale,
	underlast,
	horrortale,
	chesstale,
	copytale,
	underswap,
	epictale,
	dontforget,
	storyshift,
	facingdemons,
	badtimetrio
}

enum fight_state {
	choosing,
	wait,
	dodge,
	battle,
	reset,
	ending,
	undefined
}
	
enum fight_depth {
	bg = -100,
	enemy = -200,
	player = -200,
	bullet = -300,
	border = -400,
	bullet_outside = -600,
	soul = -800,
	bullet_outside_hight = -900,
	ui = -1000,
	ui_hight = -1100,
}

enum fight_action_type {
	empty = 0,
	skip = 1,
	attack_1 = 2,
	attack_2 = 3,
	attack_3 = 4,
	special_attack = 5
}

enum battle_border {
	x = 240,
	y = 125,
	up = 75,
	down = 75,
	left = 75,
	right = 75
}

enum battle_soul_type {
	red,
	orange,
	yellow,
	green,
	cyan,
	blue,
	purple,
	white
}

enum gameover {
	lose,
	win
}

enum match_type {
	common_1vs1,
	rating_1vs1,
	tournament_1vs1,
	common_2vs2,
	rating_2vs2,
	tournament_2vs2
}