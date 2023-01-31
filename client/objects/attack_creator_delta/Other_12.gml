// Create border
border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;

battle_border_set_color(false, false, c_purple);

// Create soul
soul = create_soul(border.x, border.y, battle_soul_type.orange);

// Create Δ delta Δ
//var dl = char_dani_delta; if (!instance_exists(dl)) delta = instance_create_depth(border.x, border.y, fight_depth.bullet_outside, dl);

if (_time >= 480) instance_destroy();