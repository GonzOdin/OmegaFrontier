/// @function dAngleBetween(x1,y1,x2,y2)
/// @description
/// @param {real} x1
/// @param {real} y1
/// @param {real} x2
/// @param {real} y2

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

var vec1_magnitude = sqrt((x1*x1)+(y1*y1));
var vec2_magnitude = sqrt((x2*x2)+(y2*y2));

return darccos( dot_product(x1,y1,x2,y2)/(vec1_magnitude*vec2_magnitude) );