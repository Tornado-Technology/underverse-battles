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
function send_heal_action(player_id, hp) {
	send("fightHealAction", {
		playerId: player_id,
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

function send_battle_object_drop(x, y, object, speed, direction, use_gravity_force, storage_index) {
	send("battleCreateObject", {
		objectType: 0,
		x: x,
		y: y,
		object: object,
		speed: speed,
		direction: direction,
		useGravity: use_gravity_force,
		storageIndex: storage_index
	});
}

function send_battle_object_broomie(x, y, object, direction, side, angle_speed, max_acceleration, storage_index) {
	send("battleCreateObject", {
		objectType: 1,
		x: x,
		y: y,
		object: object,
		direction: direction,
		side: side,
		angleSpeed: angle_speed,
		maxAcceleration: max_acceleration,
		storageIndex: storage_index
	});
}

function send_battle_object_bone(x, y, object, speed, size, direction, angle, storage_index) {
	send("battleCreateObject", {
		objectType: 2,
		x: x,
		y: y,
		object: object,
		speed: speed,
		size: size,
		direction: direction,
		angle: angle,
		storageIndex: storage_index
	});
}

function send_battle_object_falling_bone(x, y, object, angle, direction, scale, acceleration, storage_index) {
	send("battleCreateObject", {
		objectType: 3,
		x: x,
		y: y,
		object: object,
		angle: angle,
		direction: direction,
		scale: scale,
		acceleration: acceleration,
		storageIndex: storage_index
	});
}

function send_battle_object_poking_bone(x, y, object, speed, size, direction, storage_index) {
	send("battleCreateObject", {
		objectType: 4,
		x: x,
		y: y,
		object: object,
		speed: speed,
		size: size,
		direction: direction,
		storageIndex: storage_index
	});
}

function send_battle_object_spinning_bone(x, y, object, speed, size, direction, angle, angle_speed, storage_index) {
	send("battleCreateObject", {
		objectType: 5,
		x: x,
		y: y,
		object: object,
		speed: speed,
		size: size,
		direction: direction,
		angle: angle,
		angleSpeed: angle_speed,
		storageIndex: storage_index
	});
}

function send_battle_object_solo_moving_platform(x, y, scale, speed, left_station, right_station, storage_index) {
	send("battleCreateObject", {
		objectType: 6,
		x: x,
		y: y,
		scale: scale,
		speed: speed,
		leftStation: left_station,
		rightStation: right_station,
		storageIndex: storage_index
	});
}

function send_battle_object_moving_platforms(x, y, count, scale, distance, speed, storage_index) {
	send("battleCreateObject", {
		objectType: 7,
		x: x,
		y: y,
		count: count,
		scale: scale,
		distance: distance,
		speed: speed,
		storageIndex: storage_index
	});
}

function send_battle_object_next_moving_platform(x, y, count, scale, distance, speed, storage_index) {
	send("battleCreateObject", {
		objectType: 8,
		x: x,
		y: y,
		count: count,
		scale: scale,
		distance: distance,
		speed: speed,
		storageIndex: storage_index
	});
}

function send_battle_object_gasterblaster(x, y, object, target_x, target_y, angle, fly_time, charge_time, flyout_time, destroy_time, storage_index) {
	send("battleCreateObject", {
		objectType: 9,
		x: x,
		y: y,
		object: object,
		targetX: target_x,
		targetY: target_y,
		angle: angle,
		flyTime: fly_time,
		chargeTime: charge_time,
		flyoutTime: flyout_time,
		destroyTime: destroy_time,
		storageIndex: storage_index
	});
}

function send_battle_object_solo_gasterblaster(x, y, object, target_time, charge_time, destroy_time, storage_index) {
	send("battleCreateObject", {
		objectType: 10,
		x: x,
		y: y,
		object: object,
		targetTime: target_time,
		chargeTime: charge_time,
		destroyTime: destroy_time,
		storageIndex: storage_index
	});
}

function send_battle_object_error_string(x, y, object, target_x, target_y, scale_speed, storage_index) {
	send("battleCreateObject", {
		objectType: 11,
		x: x,
		y: y,
		object: object,
		targetX: target_x,
		targetY: target_y,
		scaleSpeed: scale_speed,
		storageIndex: storage_index
	});
}

function send_battle_object_knife_swing(x, y, object, angle, distance, storage_index) {
	send("battleCreateObject", {
		objectType: 12,
		x: x,
		y: y,
		object: object,
		angle: angle,
		distance: distance,
		storageIndex: storage_index
	});
}

function send_battle_object_big_knife_x(x, y, object, direction, angle, point_stop_x, storage_index) {
	send("battleCreateObject", {
		objectType: 13,
		x: x,
		y: y,
		object: object,
		direction: direction,
		angle: angle,
		pointStopX: point_stop_x,
		storageIndex: storage_index
	});
}

function send_battle_object_big_knife_y(x, y, object, direction, angle, point_stop_y, storage_index) {
	send("battleCreateObject", {
		objectType: 14,
		x: x,
		y: y,
		object: object,
		direction: direction,
		angle: angle,
		pointStopY: point_stop_y,
		storageIndex: storage_index
	});
}

function send_battle_object_damage_wave(x, y, object, angle, speed, storage_index) {
	send("battleCreateObject", {
		objectType: 15,
		x: x,
		y: y,
		object: object,
		angle: angle,
		speed: speed,
		storageIndex: storage_index
	});
}

function send_battle_object_spike(x, y, object, speed, direction, storage_index) {
	send("battleCreateObject", {
		objectType: 16,
		x: x,
		y: y,
		object: object,
		speed: speed,
		direction: direction,
		storageIndex: storage_index
	});
}

function send_battle_object(x, y, depth, object, var_struct, storage_index) {
	send("battleCreateObject", {
		objectType: -1,
		x: x,
		y: y,
		depth: depth,
		object: object,
		varStruct: var_struct,
		storageIndex: storage_index
	});
}

function send_battle_replace_object_bone(number, x, y, object, speed, size, direction, angle, storage_index) {
	send("battleReplaceObject", {
		objectType: 2,
		number: number,
		x: x,
		y: y,
		object: object,
		speed: speed,
		size: size,
		direction: direction,
		angle: angle,
		storageIndex: storage_index
	});
}

function send_battle_object_bone_move(number, speed, direction, storage_index) {
	send("battleChangeObjectData", {
		objectType: 2,
		eventName: 0,
		number: number,
		speed: speed,
		direction: direction,
		storageIndex: storage_index
	});
}

function send_battle_object_bone_scale(number, scale, scale_step, storage_index) {
	send("battleChangeObjectData", {
		objectType: 2,
		eventName: 1,
		number: number,
		scale: scale,
		scaleStep: scale_step,
		storageIndex: storage_index
	});
}

function send_battle_object_bone_shake(number, storage_index) {
	send("battleChangeObjectData", {
		objectType: 2,
		eventName: 2,
		number: number,
		storageIndex: storage_index
	});
}

function send_battle_object_change_angle_speed_spinning_bone(number, angle_speed, is_smooth, storage_index) {
	send("battleChangeObjectData", {
		objectType: 5,
		eventName: 0,
		number: number,
		angleSpeed: angle_speed,
		isSmooth: is_smooth,
		storageIndex: storage_index
	});
}

function send_battle_object_change_solo_gasterblaster_position(number, new_x, new_y, storage_index) {
	send("battleChangeObjectData", {
		objectType: 10,
		eventName: 0,
		number: number,
		newX: new_x,
		newY: new_y,
		storageIndex: storage_index
	});
}

function send_battle_object_change_solo_gasterblaster_target(number, target, storage_index) {
	send("battleChangeObjectData", {
		objectType: 10,
		eventName: 1,
		number: number,
		target: target,
		storageIndex: storage_index
	});
}

function send_battle_object_big_knife_move(number, distance, storage_index) {
	send("battleChangeObjectData", {
		objectType: 13,
		eventName: 0,
		number: number,
		distance: distance,
		storageIndex: storage_index
	});
}

function send_battle_object_big_knife_move_up(number, storage_index) {
	send("battleChangeObjectData", {
		objectType: 13,
		eventName: 1,
		number: number,
		storageIndex: storage_index
	});
}

function send_battle_object_big_knife_spin(number, rotating_speed, storage_index) {
	send("battleChangeObjectData", {
		objectType: 13,
		eventName: 2,
		number: number,
		rotatingSpeed: rotating_speed,
		storageIndex: storage_index
	});
}

function send_destroy_battle_object(storage_index) {
	send("battleDestroyObject", {
		storageIndex: storage_index
	});
}

function send_destroy_battle_object_by_edit(color, count, distance, storage_index) {
	send("battleDestroyObjectByEdit", {
		color: color,
		count: count,
		distance: distance,
		storageIndex: storage_index
	});
}
