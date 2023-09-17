function get_arrow() {
    var controls = global.__ui_controls_instance;
    if (controls == noone) return;

    if (controls.controllers_index != control_input_mode.ui_arrows) return;

    return controls.get_controller();

}