function send_information() {
	send("information", {
		information: json_stringify(generate_client_information()),
	});
}

function send_ping() {
    send("ping", {
		time: round(get_timer() / 1000),
	});
}

/// @param {Real} time
function send_pong(time) {
    send("pong", {
		time: time,
	});
}

function send_logout() {
	send("logout");
}

/// @param {String} username
/// @param {String} password
function send_login(username, password) {
	send("login", {
		username: username,
		password: password
	});
}

/// @param {String} username
/// @param {String} password
/// @param {String} email
function send_register(username, password, email) {
	send("register", {
		username: username,
		password: password,
		email: email
	});
}

function send_delete_account() {
	send("deleteAccount");
}

/// @param {Real} code
function send_verification(code) {
	send("verification", {
		code: code,
	});
}

/// @param {String} email
function send_eamil_change(email) {
	send("changeEmail", {
		email: email,
	});
}

/// @param {String} password
function send_password_change(password) {
	send("changePassword", {
		password: password,
	});
}

/// @param {String} username
function send_username_change(username) {
	send("changeUsername", {
		username: username,
	});
}

/// @param {String} nickname
function send_nickname_change(nickname) {
	send("changeNickname", {
		nickname: nickname,
	});
}

/// @param {String} nickname
/// @param {String} password
function send_password_retrieval(identifier, password) {
	send("restorePassword", {
		identifier: identifier,
		password: password,
	});
}

/// @param {Real} character_id
/// @param {Real} skin_id
function send_fight_join(character_id, skin_id) { 
    send("fightJoin", {
		characterId: character_id,
		skinId: skin_id,
	});
}

function send_fight_joined() {
    send("fightJoined");
}

function send_fight_join_reject() {
    send("fightJoinReject");
}

/// @param {Real} action
function send_fight_action(action) {
    send("fightAction", {
		action: action,
	});
}

/// @param {Real} pow
function send_fight_power(pow) {
    send("fightPower", {
		power: pow,
	});
}

function send_fight_special_action() {
    send("fightSpecialAction");
}

function send_fight_extra_action() {
    send("fightExtraAction");
}

function send_fight_skip() {
    send("fightSkip");
}

/// @param {Real} x
/// @param {Real} y
/// @param {Real} angle
/// @param {Real} ability
function send_fight_soul(x, y, angle, ability) {
    send("fightSoul", {
		x: x, 
		y: y, 
		angle: angle, 
		ability: ability,
	});
}

function send_fight_finish_battle(initiative, damage) {
    send("battleFinish", {
		initiative: initiative,
		damage: damage
	});
}

/// @param {Real} damage
function send_fight_damage(damage) {
	send("fightDamage", {
		damage: damage,
	});
}

function send_fight_kill() {
	send("fightKill");
}

/// @param {Real} hp
function send_fight_hp(hp) {
	send("fightHp", {
		hp: hp,
	});
}

/// @param {Real} hp
function send_heal_action(hp) {
	send("fightHealAction", {
		hp: hp,
	});
}

/// @param {Real} mana
function send_fight_mana(mana) {
	send("fightMana", {
		mana: mana,
	});
}

function send_fight_stun() {
	send("fightStun");
}

function send_fight_collider_soul_data() {
	send("fightColliderSoul");
}

function send_fight_loaded() {
	send("fightLoaded");
}

function send_battle_border(up, down, left, right) {
	send("battleCreateBorder", {
		up: up,
		down: down,
		left: left,
		right: right
	});
}

function send_battle_soul(x, y, type) {
	send("battleCreateSoul", {
		x: x,
		y: y,
		type: type
	});
}

// Battle object

function send_battle_object_drop(x, y, object, speed, direction, use_gravity_force) {
	send("battleCreateObject", {
		objectName: "drop",
		x: x,
		y: y,
		object: object,
		speed: speed,
		direction: direction,
		useGravity: use_gravity_force
	});
}

function send_battle_object_broomie(x, y, object, direction, side, angle_speed, max_acceleration) {
	send("battleCreateObject", {
		objectName: "broomie",
		x: x,
		y: y,
		object: object,
		direction: direction,
		side: side,
		angleSpeed: angle_speed,
		maxAcceleration: max_acceleration
	});
}

function send_battle_object_bone(x, y, object, speed, size, direction, angle) {
	send("battleCreateObject", {
		objectName: "bone",
		x: x,
		y: y,
		object: object,
		speed: speed,
		size: size,
		direction: direction,
		angle: angle
	});
}

function send_battle_object_falling_bone(x, y, object, angle, direction, scale, acceleration) {
	send("battleCreateObject", {
		objectName: "falling bone",
		x: x,
		y: y,
		object: object,
		angle: angle,
		direction: direction,
		scale: scale,
		acceleration: acceleration
	});
}

function send_battle_object_poking_bone(x, y, object, speed, size, direction) {
	send("battleCreateObject", {
		objectName: "poking bone",
		x: x,
		y: y,
		object: object,
		speed: speed,
		size: size,
		direction: direction
	});
}

function send_battle_object_spinning_bone(x, y, object, speed, size, direction, angle, angle_speed) {
	send("battleCreateObject", {
		objectName: "spinning bone",
		x: x,
		y: y,
		object: object,
		speed: speed,
		size: size,
		direction: direction,
		angle: angle,
		angleSpeed: angle_speed
	});
}

function send_battle_object_solo_moving_platform(x, y, scale, speed, left_station, right_station) {
	send("battleCreateObject", {
		objectName: "solo moving platform",
		x: x,
		y: y,
		scale: scale,
		speed: speed,
		leftStation: left_station,
		rightStation: right_station
	});
}

function send_battle_object_moving_platforms(x, y, count, scale, distance, speed) {
	send("battleCreateObject", {
		objectName: "moving platforms",
		x: x,
		y: y,
		count: count,
		scale: scale,
		distance: distance,
		speed: speed
	});
}

function send_battle_object_next_moving_platform(x, y, count, scale, distance, speed) {
	send("battleCreateObject", {
		objectName: "next moving platform",
		x: x,
		y: y,
		count: count,
		scale: scale,
		distance: distance,
		speed: speed
	});
}

function send_battle_object_gasterblaster(x, y, object, target_x, target_y, angle, fly_time, charge_time, flyout_time, destroy_time) {
	send("battleCreateObject", {
		objectName: "gasterblaster",
		x: x,
		y: y,
		object: object,
		targetX: target_x,
		targetY: target_y,
		angle: angle,
		flyTime: fly_time,
		chargeTime: charge_time,
		flyoutTime: flyout_time,
		destroyTime: destroy_time
	});
}

function send_battle_object_error_string(x, y, object, target_x, target_y, angle, scale_speed) {
	send("battleCreateObject", {
		objectName: "error string",
		x: x,
		y: y,
		object: object,
		targetX: target_x,
		targetY: target_y,
		angle: angle,
		scaleSpeed: scale_speed
	});
}

function send_battle_object_knife_swing(x, y, object, angle, distance) {
	send("battleCreateObject", {
		objectName: "knife swing",
		x: x,
		y: y,
		object: object,
		angle: angle,
		distance: distance
	});
}

function send_battle_object_big_knife_x(x, y, object, direction, angle, point_stop_x) {
	send("battleCreateObject", {
		objectName: "big knife x",
		x: x,
		y: y,
		object: object,
		direction: direction,
		angle: angle,
		pointStopX: point_stop_x
	});
}

function send_battle_object_big_knife_y(x, y, object, direction, angle, point_stop_y) {
	send("battleCreateObject", {
		objectName: "big knife y",
		x: x,
		y: y,
		object: object,
		direction: direction,
		angle: angle,
		pointStopY: point_stop_y
	});
}

function send_battle_object_damage_wave(x, y, object, angle, speed) {
	send("battleCreateObject", {
		objectName: "damage wave",
		x: x,
		y: y,
		object: object,
		angle: angle,
		speed: speed
	});
}

function send_battle_object_spike(x, y, object, speed, direction) {
	send("battleCreateObject", {
		objectName: "spike",
		x: x,
		y: y,
		object: object,
		speed: speed,
		direction: direction
	});
}

function send_battle_object(x, y, depth, object, var_struct) {
	send("battleCreateObject", {
		objectName: "object",
		x: x,
		y: y,
		depth: depth,
		object: object,
		varStruct: var_struct
	});
}

function send_battle_object_big_knife_move(instance, distance) {
	send("battleChangeObjectData", {
		objectName: "big knife",
		eventName: "move",
		object: instance,
		distance: distance
	});
}

function send_battle_object_big_knife_move_up(instance) {
	send("battleChangeObjectData", {
		objectName: "big knife",
		eventName: "move up",
		object: instance
	});
}

function send_battle_object_big_knife_spin(instance, rotating_speed) {
	send("battleChangeObjectData", {
		objectName: "big knife",
		eventName: "spin",
		object: instance,
		rotatingSpeed: rotating_speed
	});
}