function statistics_set_rating_points(isWinner, rating_) {
	if (!instance_exists(obj_statistics))
		exit;
	obj_statistics.is_winner = isWinner;
	obj_statistics.rating = rating_;
}