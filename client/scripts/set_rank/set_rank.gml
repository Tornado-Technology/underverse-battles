function set_rank(rp){
	var textpath = "Menu.Statistics.RankType.";
	var rank = translate_get(textpath + "Empty");
	var rank_color = c_white;
	if (rp >= 15 && rp < 35)	{ rank = translate_get(textpath + "Gray");		rank_color = make_color_rgb(217, 217, 217); }
	if (rp >= 35 && rp < 70)	{ rank = translate_get(textpath + "Green");		rank_color = make_color_rgb(197, 224, 180); }
	if (rp >= 70 && rp < 100)	{ rank = translate_get(textpath + "Yellow");	rank_color = make_color_rgb(255, 217, 102); }
	if (rp >= 100 && rp < 140)	{ rank = translate_get(textpath + "Blue");		rank_color = make_color_rgb(180, 199, 231); }
	if (rp >= 140 && rp < 190)	{ rank = translate_get(textpath + "Cyan");		rank_color = make_color_rgb(189, 215, 238); }
	if (rp >= 190 && rp < 250)	{ rank = translate_get(textpath + "Violet");	rank_color = make_color_rgb(204, 153, 255); }
	if (rp >= 250 && rp < 335)	{ rank = translate_get(textpath + "Orange");	rank_color = make_color_rgb(255, 153, 51); }
	if (rp >= 335)				{ rank = translate_get(textpath + "Red");		rank_color = make_color_rgb(255, 63, 63); }

	return {
		rank: rank,
		color: rank_color,
	};
}