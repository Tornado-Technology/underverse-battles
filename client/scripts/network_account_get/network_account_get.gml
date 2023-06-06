/// @return {Struct.NetworkAccount|undefined}
function network_account_get() {
	return global.network_schemes.get_account();
}
