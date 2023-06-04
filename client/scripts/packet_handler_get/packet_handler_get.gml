/// @param {String} index
/// @return {Function}
function packet_handler_get(index) {
    return global.packet_handler[$ index];
}