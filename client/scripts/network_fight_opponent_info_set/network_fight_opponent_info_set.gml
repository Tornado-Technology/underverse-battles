/// @param {Struct.NetworkFightInfo|Struct}
function network_fight_opponent_info_set(fight_info) {
	global.network_fight_opponent_info = instanceof(fight_info) == "NetworkFightInfo" ? fight_info : new NetworkFightInfo(fight_info);
}
