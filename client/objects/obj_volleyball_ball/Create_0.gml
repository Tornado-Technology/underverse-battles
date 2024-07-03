height = 30;
current_force = 0;
force = 0;
speed_const = 0;
rotation = 0;
rotation_speed = 0;
step = 0.01;
step_force = 0.1;

has_first_fall = false;
is_higher = false;

if (!variable_instance_exists(id, "is_for_minigame")) is_for_minigame = true;
if (!variable_instance_exists(id, "is_holding")) is_holding = true;
if (is_for_minigame) {
	obj_volleyball_minigame.on_round_start.connect(function () {
		is_holding = false;
	});
}

punch = function(direction, speed, force) {
	self.direction = direction;
	speed_const = speed;
	rotation_speed = choose(-speed, speed);
	self.force = force;
	current_force = force;
	is_higher = false;
}

punch_down = function(direction, speed, force) {
	self.direction = direction;
	speed_const = speed;
	rotation_speed = choose(-speed, speed);
	self.force = -force;
	current_force = force;
	is_higher = true;
}

update = function() {
	height = 30;
	current_force = 0;
	force = 0;
	has_first_fall = false;
}