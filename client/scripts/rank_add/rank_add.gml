/// @param {Struct.NetworkRank|Array<Struct.NetworkRank>} ranks
function rank_add(ranks) {
	ranks = is_array(ranks) ? ranks : [ranks];
	
	var i = 0
	repeat (array_length(ranks)) {
		array_push(global.network_ranks, ranks[i]);
		i++;
	}
}
