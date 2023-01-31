/// @desc
function background_load() {
	if (data_get("Settings.Data.SaveBackground")) {
		memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.BACKGROUND_CUSTOM, data_get("Data.Background"));
	}
}
