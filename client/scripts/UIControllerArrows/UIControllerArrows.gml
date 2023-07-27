function UIControllerArrows() {
	var instance = new ClassUIControllerArrows();
	instance.declare_events();
	
	return instance;
}

function ClassUIControllerArrows() constructor {
	offset = 5;
	
	input_held = undefined;
	input_pressed = undefined;
	input_released = undefined;
	input_vector = Vector2();
	
	controls_arrow = {
		up: UIImageButton(spr_ui_controls_arrow_up),
		right: UIImageButton(spr_ui_controls_arrow_right),
		down: UIImageButton(spr_ui_controls_arrow_down),
		left: UIImageButton(spr_ui_controls_arrow_left)
	};
	
	static declare_events = function() {
		controls_arrow.up.on_press = function() {
			input_pressed = vk_up;
			input_vector.y = -1;
		}

		controls_arrow.down.on_press = function() {
			input_pressed = vk_down;
			input_vector.y = 1;
		}

		controls_arrow.right.on_press = function() {
			input_pressed = vk_right;
			input_vector.x = 1;
		}

		controls_arrow.left.on_press = function() {
			input_pressed = vk_left;
			input_vector.x = -1;
		}


		controls_arrow.up.on_held = function() {
			input_held = vk_up;
			input_pressed = undefined;
			input_vector.y = -1;
		}

		controls_arrow.down.on_held = function() {
			input_held = vk_down;
			input_pressed = undefined;
			input_vector.y = 1;
		}

		controls_arrow.right.on_held = function() {
			input_held = vk_right;
			input_pressed = undefined;
			input_vector.x = 1;
		}

		controls_arrow.left.on_held = function() {
			input_held = vk_left;
			input_pressed = undefined;
			input_vector.x = -1;
		}
		

		controls_arrow.up.on_release = function() {
			input_held = undefined;
			input_vector.y = 0;
		}

		controls_arrow.down.on_release = function() {
			input_held = undefined;
			input_vector.y = 0;
		}

		controls_arrow.right.on_release = function() {
			input_held = undefined;
			input_vector.x = 0;
		}

		controls_arrow.left.on_release = function() {
			input_held = undefined;
			input_vector.x = 0;
		}
	}
	
	static draw = function(position_x, position_y) {
		controls_arrow.up.draw(position_x, position_y - offset);
		controls_arrow.right.draw(position_x + offset, position_y);
		controls_arrow.down.draw(position_x, position_y + offset);
		controls_arrow.left.draw(position_x - offset, position_y);
	}
}