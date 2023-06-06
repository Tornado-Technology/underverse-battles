/// @param {Struct} data
function NetworkAccount(data) constructor {
	username = data.username;
	nickname = data.nickname;
	password = data.password;
	
	email = data.email;
	date = data.date;
	type = data.type;
	
	/// @return {String}
	static get_username = function() {
		return username;
	}
	
	/// @return {String}
	static get_nickname = function() {
		return nickname;
	}
	
	/// @return {String}
	static get_password = function() {
		return password;
	}
	
	/// @return {String}
	static get_email = function() {
		return email;
	}
	
	/// @return {Constant.account_type}
	static get_type = function() {
		return type;
	}
}
