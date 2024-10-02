sprite_index = noone;

if (!variable_instance_exists(id, "friend")) friend = noone;
if (!variable_instance_exists(id, "index")) index = 0;

create_fight_request = function() {
	send_friend_request(friend.accountId, request_type.fight);
}

delete_friend = function() {
	array_delete(global.friend_accounts, index, 1);
	send_remove_friend(friend.accountId);
}