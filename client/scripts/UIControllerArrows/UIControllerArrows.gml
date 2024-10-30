function UIControllerArrows() {
	var instance = new ClassUIControllerArrows();
	
	return instance;
}

function ClassUIControllerArrowsUp () constructor {
	
	controls_arrow =  new UIImageButton(0, spr_ui_controls_arrow_up);	
	controls_arrow.is_multi_touch = true;
	
	static input_update = function() {
		if (controls_arrow.pressed) {
			keyboard_key_press(vk_up);	
		} else {
			keyboard_key_release(vk_up)	
		}
	}
	
	static draw = function (position_x, position_y) {
		var key_scale = "Settings.MobileControls.Controller.Arrows.Scale.";
		controls_arrow.scale_x =  data_get(key_scale + "Up");
		controls_arrow.scale_y =  data_get(key_scale + "Up");
		controls_arrow.draw(position_x, position_y);
	}
}

function ClassUIControllerArrowsDown () constructor {
	
	controls_arrow = new UIImageButton(1, spr_ui_controls_arrow_down);
	controls_arrow.is_multi_touch = true;
	
	static input_update = function() {
		if (controls_arrow.pressed) {
			keyboard_key_press(vk_down);	
		} else {
			keyboard_key_release(vk_down);	
		}	
	}
	
	static draw = function (position_x, position_y) {
		var key_scale = "Settings.MobileControls.Controller.Arrows.Scale.";
		controls_arrow.scale_x =  data_get(key_scale + "Down");
		controls_arrow.scale_y =  data_get(key_scale + "Down");
		controls_arrow.draw(position_x, position_y);
	}
}


function ClassUIControllerArrowsLeft () constructor {
	
	controls_arrow =  new UIImageButton(2, spr_ui_controls_arrow_left);	
	controls_arrow.is_multi_touch = true;
	
	static input_update = function() {
		if (controls_arrow.pressed) {
			keyboard_key_press(vk_left);	
		} else {
			keyboard_key_release(vk_left);
		}	
	}
	
	
	static draw = function (position_x, position_y) {
		var key_scale = "Settings.MobileControls.Controller.Arrows.Scale.";
		controls_arrow.scale_x =  data_get(key_scale + "Left");
		controls_arrow.scale_y =  data_get(key_scale + "Left");
		controls_arrow.draw(position_x, position_y);
		
	}
}

function ClassUIControllerArrowsRight () constructor {
	
	controls_arrow =  new UIImageButton(3, spr_ui_controls_arrow_right);
	controls_arrow.is_multi_touch = true;
	
	static input_update = function() {
		if (controls_arrow.pressed) {
			keyboard_key_press(vk_right);	
		} else {
			keyboard_key_release(vk_right);
		}	
	}
	
	static draw = function (position_x, position_y) {		
		var key_scale = "Settings.MobileControls.Controller.Arrows.Scale.";
		controls_arrow.scale_x =  data_get(key_scale + "Right");
		controls_arrow.scale_y =  data_get(key_scale + "Right");
		controls_arrow.draw(position_x, position_y);
	}
}

function ClassUIControllerArrows() constructor {
	
	input_held = undefined;
	input_pressed = undefined;
	input_released = undefined;
	

	button = {
		up: new ClassUIControllerArrowsUp(),
		down: new ClassUIControllerArrowsDown(),
		left: new ClassUIControllerArrowsLeft(),
		right: new ClassUIControllerArrowsRight()
	}
		
	input_vector = new Vector2(0, 0);
	
	static input_update = function() {		
		struct_foreach(button, function(name, value) {
			value.input_update();	
		}) 	
		
	}

	static draw = function(position_x, position_y) {	
		var key_scale = "Settings.MobileControls.Controller.Arrows.Scale.";
		var strunct  = [button.up, button.down,button.left, button.right];
		var scale = ["Up", "Down","Left", "Right"];
		
		button.up.draw(position_x[0], position_y[0]);
		button.down.draw(position_x[1], position_y[1]);
		button.left.draw(position_x[2], position_y[2]);
		button.right.draw(position_x[3], position_y[3]);	
			
		var i = 0;
		repeat(array_length(strunct) ) {
			strunct[i].scale_x =  data_get(key_scale + scale[i]);
			strunct[i].scale_y =  data_get(key_scale + scale[i]);
		i++;	
		}
	}
	
	static reset = function () {
		button = {
			up: new ClassUIControllerArrowsUp(),
			down: new ClassUIControllerArrowsDown(),
			left: new ClassUIControllerArrowsLeft(),
			right: new ClassUIControllerArrowsRight()
		} 	
	
	};
}
