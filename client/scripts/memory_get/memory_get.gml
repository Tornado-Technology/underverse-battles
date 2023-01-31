/// @param type
/// @param slot
/// @param default
function memory_get(_type, _slot, _default = undefined) {
	var memory = global._core_memory;
	var memory_slot = memory[$ _type];
	
	if (!variable_struct_exists(memory, _type) || !variable_struct_exists(memory_slot, _slot)) return _default;
	
	return memory_slot[$ _slot];
}