function UIControllerArrows() {
	var instance = new ClassUIControllerArrows();
	instance.declare_predicate();

	return instance;
}

function ClassUIControllerArrows() constructor {
	
	input_held = undefined;
	input_pressed = undefined;
	input_released = undefined;

	_input_pressed = undefined
	
	controls_arrow = {
		up: UIImageButton(spr_ui_controls_arrow_up),
		right: UIImageButton(spr_ui_controls_arrow_right),
		down: UIImageButton(spr_ui_controls_arrow_down),
		left: UIImageButton(spr_ui_controls_arrow_left)
	};
	
	input_vector = new Vector2(0, 0);
	
	static declare_predicate = function() {
			
		controls_arrow.up.on_hover = function() { 
				input_pressed = undefined;
		};

		controls_arrow.down.on_hover = function() { 
				input_pressed = undefined;
		};
		
		controls_arrow.left.on_hover = function() { 
				input_pressed = undefined;
		};
		
		controls_arrow.right.on_hover = function () {
			input_pressed = undefined
		}
		
		controls_arrow.up.on_press = function() {
			input_pressed = vk_up;			
		};
				
		controls_arrow.down.on_press = function() {
			 input_pressed = vk_down;
		};

		controls_arrow.right.on_press = function() {
			  input_pressed = vk_right;	
		};

	
		controls_arrow.up.on_held = function () {
				input_held = vk_up;
		}
	
		controls_arrow.down.on_held = function() {
			input_held = vk_down;	
		};

		controls_arrow.right.on_held = function() {
			input_held = vk_right;
		};

		controls_arrow.left.on_held = function() {
			input_held = vk_left;			
		};

		controls_arrow.up.on_release = function() {
			input_held = undefined;
			input_pressed = undefined;	
		};

		controls_arrow.down.on_release = function() {
			input_held = undefined;	
			input_pressed = undefined;	
		};

		controls_arrow.right.on_release = function() {	
			input_held = undefined;	
			input_pressed = undefined;	
		};

		controls_arrow.left.on_release = function() {
			input_held = undefined;
			input_pressed = undefined;	
		};
		
	};	
	
	static draw = function(up_position_x, up_position_y, down_position_x, down_position_y, left_position_x, left_position_y, right_position_x, right_position_y) {
		controls_arrow.up.draw(up_position_x, up_position_y);
		controls_arrow.right.draw(right_position_x , right_position_y);
		controls_arrow.down.draw(down_position_x, down_position_y);
		controls_arrow.left.draw(left_position_x , left_position_y);
	}
}