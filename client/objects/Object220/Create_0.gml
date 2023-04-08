binarySearch = function(value, list) {
    var first = 0;
    var last = array_length(list) - 1;
    var position = -1;
    var found = false;
    var middle = undefined;
    while (!found && first <= last) {
        middle = floor((first + last) / 2);
		
        if (list[middle] <= value) {
			var is_next_element = array_length(list) > middle + 1;
			
			if (!is_next_element) {
				found = true;
				position = middle;
				continue;
			}
			
			if (list[middle + 1] > value) {
				found = true;
				position = middle;
				continue;
			}
        } 
		
		if (list[middle] > value) {
            last = middle - 1;
			continue;
        }
		
        first = middle + 1;
    }
	
    return position;
}

array = [1, 10, 14, 16, 18, 25];
number = 17;

show_debug_message(binarySearch(number, array));
