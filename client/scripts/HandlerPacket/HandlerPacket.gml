/// @param {Struct} data - Data from server for handle
function handle_packet(data) {
    var callback = packet_handler_get(data.index);
    if (callback == undefined) {
        logger.warning($"Unknown network command: {data.index}.");
        return;
    }
    
    callback(data);
}