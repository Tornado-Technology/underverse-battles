visible = !visible;
repeats--;

if (repeats == 0) instance_destroy();

alarm_set(0, period);