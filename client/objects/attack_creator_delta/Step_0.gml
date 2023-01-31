/// @desc Update
if (!obj_fight.battle_continues) instance_destroy();
if (_id > -1 && _id < 4) event_user(_id);
time++;
