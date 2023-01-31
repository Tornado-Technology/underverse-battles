/// @desc
function soundtrack_load() {
	if (data_get("Settings.Data.SaveSoundtrack")) {
		memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK_CUSTOM, soundtrack_get("id", data_get("Data.Soundtrack")));
	}
}
