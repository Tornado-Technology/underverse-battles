/// @param {String} index
/// @param {Function} callback
function packet_handler_register(index, callback) {
    global.packet_handler[$ index] = callback;
}
