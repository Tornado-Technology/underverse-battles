function input_init_bind_default() {
	input_bind_default(input.up, [Key(device.keyboard, vk_up), Key(device.gamepad, gp_padu), Key(device.virtual_arrows, vk_up), Key(device.virtual_joystick, vk_up)]);
	input_bind_default(input.down, [Key(device.keyboard, vk_down), Key(device.gamepad, gp_padd), Key(device.virtual_arrows, vk_down), Key(device.virtual_joystick, vk_down)]);
	input_bind_default(input.left, [Key(device.keyboard, vk_left), Key(device.gamepad, gp_padl), Key(device.virtual_arrows, vk_left), Key(device.virtual_joystick, vk_left)]);
	input_bind_default(input.right, [Key(device.keyboard, vk_right), Key(device.gamepad, gp_padr), Key(device.virtual_arrows, vk_right), Key(device.virtual_joystick, vk_right)]);
	input_bind_default(input.action, [Key(device.keyboard, vk_enter), Key(device.gamepad, gp_face1)]);
	input_bind_default(input.skip, [Key(device.keyboard, vk_shift), Key(device.keyboard, "X"), Key(device.gamepad, gp_face2)]);
	input_bind_default(input.special, [Key(device.keyboard, "C"), Key(device.gamepad, gp_face4)]);
	input_bind_default(input.anykey, [Key(device.keyboard, vk_anykey), Key(device.gamepad, gp_face1)]);
	input_bind_default(input.back, [Key(device.keyboard, vk_escape), Key(device.gamepad, gp_face2)]);
	input_bind_default(input.fullscreen, [Key(device.keyboard, vk_f11), Key(device.gamepad, gp_select)]);
	input_bind_default(input.debug, Key(device.keyboard, vk_f7));
	input_bind_default(input.joytek_horizontal_movements, [Key(device.gamepad, gp_axislh), Key(device.gamepad, gp_axisrh)]);
	input_bind_default(input.joytek_vertical_movements,  [Key(device.gamepad, gp_axislv), Key(device.gamepad, gp_axisrv)]);
}