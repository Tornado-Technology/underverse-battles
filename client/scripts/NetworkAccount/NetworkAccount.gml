/// @description Reference to IAccount (server/src/database/schemas/account.ts)
function NetworkAccount() constructor {
	username = "";
	nickname = "";
	password = "";
	email = "";
	date = undefined;
	type = account_type.user;
	
	static default_username = "User";

	/// @param {Struct} data
	static set = function(data) {
		try {
			username = data.username;
			nickname = data.nickname;
			password = data.password;
			email = data.email;
			date = data.date;
			type = data.type;
		} catch (exception) {
			throw new StructIndentityException(new NetworkAccount(), data);
		}
		
		return self;
	}

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

enum account_type {
  user = 0,
  beta_tester = 1,
  administrator = 2,
  developer = 3,
}
