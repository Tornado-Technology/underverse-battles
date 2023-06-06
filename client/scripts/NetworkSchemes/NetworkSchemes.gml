function NetworkSchemes() constructor {
	account = undefined;
	profile = undefined;

	static clear = function() {
		account = undefined;
		profile = undefined;
	}

	/// @param {Struct.NetworkAccount|Struct} account
	/// @param {Struct.NetworkProfile|Struct} profile
	static set = function(account, profile) {
		self.account = instanceof(account) == "NetworkAccount" ? account : new NetworkAccount(account);
		self.profile = instanceof(profile) == "NetworkProfile" ? profile : new NetworkProfile(profile);
	}
	
	/// @return {Struct.NetworkAccount|undefined}
	static get_account = function() {
		return account;
	}
	
	/// @return {Struct.NetworkProfile|undefined}
	static get_profile = function() {
		return profile;
	}
}
