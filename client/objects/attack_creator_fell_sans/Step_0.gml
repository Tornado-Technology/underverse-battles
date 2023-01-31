if (battle_border_start_animation_end()) exit;

if (_id > -1 && _id < 4) event_user(_id);

if(!obj_fight.battle_continues) instance_destroy();