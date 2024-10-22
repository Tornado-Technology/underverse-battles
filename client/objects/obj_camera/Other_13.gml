/// @description Zoom
if (has_smooth_zoom) {
	zoom = lerp(zoom, zoom_required, zoom_speed);
} else {
	zoom = approach(zoom, zoom_required, zoom_speed);
}
	
view_width = default_view_width / zoom;
view_height = default_view_height / zoom;