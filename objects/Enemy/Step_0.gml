/// @description Insert description here
// You can write your code in this editor


//turn toward player

global_x = x;
global_y = y;

target_x = Player.x;
target_y = Player.y;

delta_x = target_x - global_x;
delta_y = target_y - global_y;

dir_x = dcos(phy_rotation);
dir_y = dsin(phy_rotation);


left_side_x = x + (dcos(phy_rotation - 90)*sprite_width*0.5);
left_side_y = y + (dsin(phy_rotation - 90)*sprite_width*0.5);
 

left_side_delta_x = target_x - left_side_x;
left_side_delta_y = target_y - left_side_y;

right_side_x = x + (dcos(phy_rotation +90)*sprite_width*0.5);
right_side_y = y + (dsin(phy_rotation +90)*sprite_width*0.5);

right_side_delta_x = target_x - right_side_x;
right_side_delta_y = target_y - right_side_y;


var left_vec_x = dcos(phy_rotation + 90);
var left_vec_y = dsin(phy_rotation + 90);

var player_forward = false;
var player_behind = false;

delta_magnitude = sqrt((delta_x*delta_x)+(delta_y*delta_y));

//angle_X = arccosine(dot product / lengths multiplied)
var angle_between = darccos( dot_product(delta_x,delta_y,dir_x,dir_y)/delta_magnitude );

var percent_away = delta_magnitude / 2500;
if (percent_away > 100) {
	percent_away = 100;
}
var percent_from_180 = 0;
percent_from_180 = angle_between / 180;
//At a minimum, the turn speed should be 20%
if(percent_from_180 < 0.2){
	percent_from_180 = 0.2;
}


target_on_left = dot_product(left_side_delta_x,left_side_delta_y,left_vec_x,left_vec_y) < 0;
target_on_right = dot_product(right_side_delta_x,right_side_delta_y,left_vec_x,left_vec_y) > 0;
player_forward = dot_product(delta_x,delta_y,dir_x,dir_y) > 0;
	
//If target is to the right of unit	
if(target_on_right){
	physics_apply_torque(thruster_Torque*percent_from_180);
	
}
//If target is to the left of unit
else if(target_on_left){
	physics_apply_torque(-thruster_Torque*percent_from_180);
}
//if target is forward of unit
if(player_forward){
	physics_apply_local_force(0,0,thruster_Force*percent_away,0);
}


if(isDampenerOn){
	var dampMultiplier = 2.0;
	var deadzone = 0.3;
	
	//if Rotating clockwise and player is on the left
	if(target_on_left){
		if(phy_angular_velocity > deadzone){
			physics_apply_torque(-thruster_Torque*dampMultiplier);
		}
	}
	else if(target_on_right)
	{
		if(phy_angular_velocity < -deadzone){
			physics_apply_torque(thruster_Torque*dampMultiplier);
		}
	}
	else{
		if(phy_angular_velocity > deadzone){
			physics_apply_torque(-thruster_Torque*dampMultiplier);
		}
		else if(phy_angular_velocity < -deadzone){
			physics_apply_torque(thruster_Torque*dampMultiplier);
		}
	}
	
	//If target is behind unit and unit is moving forward
	if(!player_forward){
		if(phy_speed > 0){
			var length = sqrt((phy_linear_velocity_x*phy_linear_velocity_x) + (phy_linear_velocity_y *phy_linear_velocity_y));
			var normal_x = phy_linear_velocity_x/length;
			var normal_y = phy_linear_velocity_y/length;
			var magnitude = -thruster_Force;

			physics_apply_force(phy_com_x,phy_com_y,normal_x*magnitude,normal_y*magnitude);
		}
	}
	
	
}


