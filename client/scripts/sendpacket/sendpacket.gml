// All send* functions go here

#region Ping

function send_ping() {
    send({ cmd: "ping", time: round(get_timer() / 1000) });
}

/// @param {number} time
function send_pong(_time) {
    send({ cmd: "pong", time: _time });
}

#endregion

#region Account

/// @param {string} username
/// @param {string} password
function send_login(username, password) {
	send({cmd: "login", username: username, password: password});
}

function send_register_verification(code) {
	send({cmd: "register_verification", verificationCode: code});
}

function send_logout() {
	send({cmd: "logout"});
}

/// @param {string} username
/// @param {string} nickname
/// @param {string} password
/// @param {string} email
function send_register(username, nickname, password, email) {
	send({cmd: "register", username: username, nickname: nickname, password: password, email: email});
}

/// @param {string} username
/// @param {string} password
/// @param {string} email
function send_eamil_change(username, password, email) {
	send({cmd: "email_change", username: username, password: password, email: email});
}

#endregion

#region Fight

/// @func send_fight_join()
/// @param {Real} characterId
/// @param {Real} skinId
function send_fight_join(_characterId, _skinId) { 
    send({ cmd: "fight_join", characterId: _characterId, skinId: _skinId});
}

function send_fight_joined() {
    send({ cmd: "fight_joined", code: 100 });
}

/// @func send_fight_join_reject()
function send_fight_join_reject() {
    send({ cmd: "fight_join_reject" });
}

/// @func send_fight_action()
/// @param {number} action
function send_fight_action(_action) {
    send({ cmd: "fight_action", action: _action });
}

/// @func send_fight_power()
/// @param {number} power
function send_fight_power(_power) {
    send({ cmd: "fight_power", power: _power });
}

/// @func send_fight_soul()
/// @param {number} x
/// @param {number} y
/// @param {number} angle
/// @param {number} ability
function send_fight_soul(_x, _y, _angle, _ability) {
    send({ cmd: "fight_soul", x: _x, y: _y, ang: _angle, abil: _ability });
}

/// @func send_fight_finish_battle()
function send_fight_finish_battle() {
    send({ cmd: "battle_finish" });
}

/// @func send_fight_damage()
/// @param {number} damage
function send_fight_damage(_damage) {
	send({ cmd: "fight_damage", damage: _damage });
}

function send_fight_kill() {
	send({
		cmd: "fight_kill" 
	});
}

/// @param {Real} hp - New player hp for server sync
function send_fight_hp(hp) {
	send({
		cmd: "fight_hp",
		hp: hp 
	});
}

function send_heal_action(hp) {
	send({
		cmd: "heal_action",
		hp: hp
	});
}

/// @func send_fight_stun()
function send_fight_stun() {
	send({ cmd: "fight_stun" });
}

/// @func send_fight_collider_soul_data()
function send_fight_collider_soul_data() {
	send({ cmd: "collider_soul" });
}

#endregion

#region Utils

/// @param {Real} state
function send_req_clients_with_state(state) {
	send({ cmd: "clients_with_state_count", state: state });
}

function send_information() {
	var information = json_stringify(generate_client_information());
	send({
		cmd: "information",
		information: information,
	});
}

#endregion