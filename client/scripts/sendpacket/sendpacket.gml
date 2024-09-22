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

// @param {Array} account_ids
function send_get_accounts_info(account_ids) {
	send("getAccountsInfo", {
		accountIds: account_ids,
	});
}

// @param {String} username
function send_friend_request(_username) {
	send("friendRequest", {
		accountFinder: {username: _username},
	});
}

function send_friend_request_get_all() {
	send("friendRequestGetAll");
}

// @param {Real} request_id
function send_friend_request_accept(request_id) {
	send("friendRequestAccept", {
		requestId: request_id,
	});
	send_get_accounts_info(requests[request_id].senderId);
}

// @param {Real} request_id
function send_friend_request_reject(request_id) {
	send("friendRequestReject", {
		requestId: request_id,
	});
}

// @param {Real} profile_id
function send_remove_friend(profile_id) {
	send("friendListRemove", {
		targetFinder: { profileId: profile_id }
	});
}

// @param {Real} profile_id
function send_fight_request(profile_id) {
	send("friendFightRequest", {
		targetFinder: { profileId: profile_id }
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
function send_fight_join(type, character_id, skin_id) { 
    send("fightJoin", {
		matchType: type,
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

function send_fight_extra_action(attack_index) {
    send("fightExtraAction", {
		attackIndex: attack_index,
	});
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

// @param {Real} charge
function send_fight_special_action_add_charge(charge) {
    send("fightSpecialActionAddCharge", {
		charge: charge,
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
