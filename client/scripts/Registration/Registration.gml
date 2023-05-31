function successful_registration(){
	global.successful_registration = true;
	display_show_message_info(translate_get("Menu.LogInMessage.RegistrationSuccessful"), c_lime);
}

function failed_registration_reason_second_password(){
	global.failed_registration = true;
	display_show_message_info(translate_get("Menu.LogInMessage.ErrorSecondPassword"), c_red);
}

function failed_registration(reason){
	global.failed_registration = true;
	display_show_message_info(translate_get("Menu.LogInMessage.Error." + string(reason)), c_red);
}

function invalid_registration(){
	global.failed_registration = true;
	display_show_message_info(translate_get("Menu.LogInMessage.RegistrationInvalid"), c_red);
}
