function UIControlSwitching() {
	var instance = new ClassUIControlSwitching();
	instance.declare_predicate();
	
	return instance;
};

function ClassUIControlSwitching() constructor {

	input_pressed = undefined;

	controls_switching  = {
		right: UIImageButton(spr_stat_arrow),
		left: UIImageButton(spr_stat_arrow)	
	};
	
	static declare_predicate = function() {
			
		controls_switching.left.on_hover = function() { 
				input_pressed = undefined;
		};
		
		controls_switching.right.on_hover = function () {
				input_pressed = undefined;
		}
		
		controls_switching.left.on_press = function() {
				input_pressed = vk_left;
		};

		controls_switching.right.on_press = function() {
				input_pressed = vk_right;		
		}	

		controls_switching.right.on_release = function() {	
				input_pressed = undefined;
		};

		controls_switching.left.on_release = function() {
				input_pressed = undefined;
		};	
	};	
	
	
};