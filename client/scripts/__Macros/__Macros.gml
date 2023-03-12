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
	ui = -300,
	bullet = -500,
	border = -600,
	ui_hight = -700,
	bullet_outside = -800,
	soul = -900,
	bullet_outside_hight = -1000
}

enum fight_action_type {
	empty,
	skip,
	attack1,
	attack2,
	attack3,
	special_attack,
	healing
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
	purple
}

enum gameover {
	lose,
	win
}
