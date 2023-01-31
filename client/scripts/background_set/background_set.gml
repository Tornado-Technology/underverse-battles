/// @desc
/// @param {Real} index - Background id
function background_set(index) {
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.BACKGROUND_CUSTOM, index);
	data_set("Data.Background", index);
}
