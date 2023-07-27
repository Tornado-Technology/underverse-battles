/// @param {Real} rating
/// @return {Struct.NetworkRank|undefined}
function rank_get(rating) {
	var i = 0;
	repeat (array_length(global.network_ranks)) {
		var rank = global.network_ranks[i];
		if (rank.belongs(rating)) {
			return rank;
		}
		i++;
	}
	
	return undefined;
}
