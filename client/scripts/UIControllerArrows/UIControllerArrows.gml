function UIControllerArrows() {
	var instance = new ClassUIControllerArrows();
	instance.declare_predicate();

	return instance;
}

function ClassUIControllerArrows() constructor {
	
	input_held = undefined;
	input_pressed = undefined;
	input_released = undefined;

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
				input_pressed = undefined;
		}
		
		controls_arrow.up.on_press = function() {
				input_pressed = vk_up;	
		};
				
		controls_arrow.down.on_press = function() {
				input_pressed = vk_down;
		};

		controls_arrow.left.on_press = function() {
				input_pressed = vk_left;	
		};

		controls_arrow.right.on_press = function() {
				input_pressed = vk_right;	
		};

		controls_arrow.up.on_held	= function () {
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
		
	static reset_index = function () {
		delete controls_arrow
		
		controls_arrow = {
		up		: UIImageButton(spr_ui_controls_arrow_up),
		down	: UIImageButton(spr_ui_controls_arrow_down),
		left	: UIImageButton(spr_ui_controls_arrow_left),
		right	: UIImageButton(spr_ui_controls_arrow_right)
	};

		declare_predicate();
		var key_scale = "Settings.MobileControls.Controller.Arrows.Scale.";
		var strunct  = ["up", "down", "left", "right"];
		var scale = ["Up", "Down","Left", "Right"]
		var i = 0;
			repeat (array_length(scale)) {
			controls_arrow[$ strunct[i]].scale_x = data_get(key_scale + scale[i] );
			controls_arrow[$ strunct[i]].scale_y = data_get(key_scale + scale[i] ) ;
			i++;
			};
	};
	
	static draw = function(position_x, position_y) {	
		var key_scale = "Settings.MobileControls.Controller.Arrows.Scale.";
		var strunct  = ["up", "down", "left", "right"];
		var scale = ["Up", "Down","Left", "Right"]
		var i = 0;
			repeat (array_length(scale)) {
			controls_arrow[$ strunct[i]].draw(position_x[i], position_y[i])	
			controls_arrow[$ strunct[i]].scale_x = data_get(key_scale + scale[i] );
			controls_arrow[$ strunct[i]].scale_y = data_get(key_scale + scale[i] ) ;
			i++;
			}		
	}
}