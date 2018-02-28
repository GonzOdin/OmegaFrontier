/// @description Insert description here
// You can write your code in this editor

steer_left = false;
steer_right = false;
distance_to_target = 1;


debug_on = false;
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

max_full_thrust_range = 2500;
minimum_turn_percentage = 0.2;

targetting_radius = 2000;


//Flocking behavior variables
parent_flock = 0;

separation_x = 0;
separation_y = 0;
separation_weight = 0.8;
alignment_x = 0;
alignment_y = 0;
alignment_weight = 0.7;
cohesion_x = 0;
cohesion_y = 0;
cohesion_weight = 0.4;
follow_x = 0;
follow_y = 0;
follow_weight = 1.0;

//Attack variables
firing_timer = 0;
firing_timer_limit = 30;