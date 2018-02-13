/// @description Insert description here
// You can write your code in this editor

var camera_width = 640;
var camera_height = 480;
camera_set_view_size(view_camera[0],camera_width*GameParameters.camera_Zoom,camera_height*GameParameters.camera_Zoom);
camera_set_view_pos(view_camera[0],phy_position_x - (camera_get_view_width(view_camera[0]) * 0.5), phy_position_y - (camera_get_view_height(view_camera[0])*0.5) );
camera_set_view_angle(view_camera[0],phy_rotation);


draw_self();