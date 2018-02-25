/// @description Insert description here
// You can write your code in this editor

target_on_left = false;
target_on_right = false;
delta_magnitude = 1;

debug_1 = 0;
debug_2 = 0;
debug_3 = 0;

global_x = x;
global_y = y;

target_x = 0;
target_y = 0;

delta_x = target_x - global_x;
delta_y = target_y - global_y;

dir_x = dcos(phy_rotation);
dir_y = dsin(phy_rotation);

left_side_x = x + dcos(phy_rotation + 90);
left_side_y = y + dsin(phy_rotation + 90);

left_side_delta_x = target_x - left_side_x;
left_side_delta_y = target_y - left_side_y;

right_side_x = x + dcos(phy_rotation - 90);
right_side_y = y + dsin(phy_rotation - 90);

right_side_delta_x = target_x - right_side_x;
right_side_delta_y = target_y - right_side_y;
