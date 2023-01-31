/// @param {Real} point_x
/// @param {Real} point_y
/// @param {Real} position_x
/// @param {Real} position_y
/// @param {Real} lenght_x
/// @param {Real} lenght_y
/// @return {Bool}
function point_in_elipse(point_x, point_y, position_x, position_y, lenght_x, lenght_y) {
    return (sqr(point_x - position_x) / sqr(lenght_x) + sqr(point_y - position_y) / sqr(lenght_y)) <= 1;
}
