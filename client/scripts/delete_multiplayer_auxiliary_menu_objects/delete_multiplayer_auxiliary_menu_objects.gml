function delete_multiplayer_auxiliary_menu_objects() {
	instance_destroy(obj_menu_multiplayer_characters);
	instance_destroy(obj_menu_matchmaking);
	instance_destroy(obj_menu_log_in);
	instance_destroy(obj_menu_sign_up);
	instance_destroy(obj_friend_profile);
	instance_destroy(obj_friends_selection);
	instance_destroy(obj_profile_friend_requests);
	instance_destroy(obj_profile_statistics);
}