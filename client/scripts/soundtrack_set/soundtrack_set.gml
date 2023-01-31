/// @desc
function soundtrack_set(index) {
	if (index == undefined) {
		data_set("Data.Soundtrack", -1);
		memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK_CUSTOM, undefined);
		return;
	}
	
	data_set("Data.Soundtrack", index);
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK_CUSTOM, soundtrack_get("id", index));
}
