visible = true;
period = 15;
repeats = 5;

if (!variable_instance_exists(id, "target")) target = noone;

alarm_set(0, period);