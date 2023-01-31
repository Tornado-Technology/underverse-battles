/// @param type
/// @param slot
/// @param value
function memory_set(_type, _slot, _value) {
	var memory = global._core_memory;
	var memory_slot = {};
	
	if (!variable_struct_exists(memory, _type)) memory[$ _type] = memory_slot;
	
	memory_slot = memory[$ _type];
	
	memory_slot[$ _slot] = _value;
}