/// @param {Real} type - Value from content_type enum
function content_register(type) {
	if (!variable_global_exists("__content")) {
		logger.fatal("The configuration file `__content_config__` for game content was not loaded correctly, or the `global.__content` variable was deleted at runtime!");
		return;
	}
	
	
}
