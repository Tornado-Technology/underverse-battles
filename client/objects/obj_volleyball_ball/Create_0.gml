height = 30;
current_force = 0;
force = 0;
speed_const = 0;
rotation = 0;
rotation_speed = 0;
has_first_fall = false;
is_holding = true;
is_higher = false;

obj_volleyball_minigame.on_round_start.connect(function () {
	is_holding = false;
});

punch = function(direction, speed, force) {
	self.direction = direction;
	speed_const = speed;
	rotation_speed = choose(-speed, speed);
	self.force = force;
	current_force = force;
	is_higher = false;
}

update = function() {
	height = 30;
	current_force = 0;
	force = 0;
	has_first_fall = false;
}