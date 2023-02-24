function send_information() {
	send("information", {
		information:  json_stringify(generate_client_information()),
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

/// @param {String} username
/// @param {String} password
/// @param {String} email
function send_eamil_change(username, password, email) {
	send("email_change", {
		username: username,
		password: password,
		email: email,
	});
}

/// @param {Real} character_id
/// @param {Real} skin_id
function send_fight_join(character_id, skin_id) { 
    send("fight_join", {
		characterId: character_id,
		skinId: skin_id,
	});
}

function send_fight_joined() {
    send("fight_joined", {
		code: 100,
	});
}

function send_fight_join_reject() {
    send("fight_join_reject");
}

/// @param {Real} action
function send_fight_action(action) {
    send("fight_action", {
		action: action,
	});
}

/// @param {Real} pow
function send_fight_power(pow) {
    send("fight_power", {
		power: pow,
	});
}

/// @param {Real} x
/// @param {Real} y
/// @param {Real} angle
/// @param {Real} ability
function send_fight_soul(x, y, angle, ability) {
    send("fight_soul", {
		x: x, 
		y: y, 
		ang: angle, 
		abil: ability,
	});
}

function send_fight_finish_battle() {
    send("battle_finish");
}

/// @param {Real} damage
function send_fight_damage(damage) {
	send("fight_damage", {
		damage: damage,
	});
}

function send_fight_kill() {
	send("fight_kill");
}

/// @param {Real} hp
function send_fight_hp(hp) {
	send("fight_hp", {
		hp: hp,
	});
}

/// @param {Real} hp
function send_heal_action(hp) {
	send("heal_action", {
		hp: hp,
	});
}

function send_fight_stun() {
	send("fight_stun");
}

function send_fight_collider_soul_data() {
	send("collider_soul");
}

/// @param {Real} state
function send_req_clients_with_state(state) {
	send("clients_with_state_count", {
		state: state,
	});
}
