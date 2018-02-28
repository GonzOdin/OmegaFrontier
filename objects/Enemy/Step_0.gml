/// @description Update code for the Enemy unit

//Reset flock behavior variables
separation_x = 0;
separation_y = 0;
alignment_x = 0;
alignment_y = 0;
cohesion_x = 0;
cohesion_y = 0;
follow_x = 0;
follow_y = 0;

//Objects x and y position
//GLOBAL SPACE
global_x = phy_position_x;
global_y = phy_position_y;
//Left side of object, x,y position
//GLOBAL SPACE
left_side_x = global_x + (dcos(phy_rotation - 90)*sprite_width*0.5);
left_side_y = global_y + (dsin(phy_rotation - 90)*sprite_width*0.5);
//Right side of object, x y position
//GLOBAL SPACE
right_side_x = global_x + (dcos(phy_rotation +90)*sprite_width*0.5);
right_side_y = global_y + (dsin(phy_rotation +90)*sprite_width*0.5);

//target_x = Player.x;
//target_y = Player.y;

//Direction vector of magnitude 1
//LOCAL SPACE
dir_x = dcos(phy_rotation);
dir_y = dsin(phy_rotation);
//Distance between target and this object
//LOCAL SPACE
delta_x = target_x - global_x;
delta_y = target_y - global_y;
//Distance between target and left side
//LOCAL SPACE
left_side_delta_x = target_x - left_side_x;
left_side_delta_y = target_y - left_side_y;
//Distance between target and right side
//LOCAL SPACE
right_side_delta_x = target_x - right_side_x;
right_side_delta_y = target_y - right_side_y;

//Vector perpendicular to direction for determining LEFT OF and RIGHT OF 
var left_vec_x = dcos(phy_rotation + 90);
var left_vec_y = dsin(phy_rotation + 90);



distance_to_target = sqrt((delta_x*delta_x)+(delta_y*delta_y));

//Angle between target and direction vector
var angle_between = dAngleBetween(delta_x,delta_y,dir_x,dir_y);

//0 to 100% from 0 to max_full_thrust_range (pixels)
var percent_away = distance_to_target / max_full_thrust_range;
if (percent_away > 100) {
	percent_away = 100;
}

//0 to 100% from 0 to 180 degrees
var percent_from_180 = 0;
percent_from_180 = angle_between / 180;
//At a minimum, the turn speed should be 20%
if(percent_from_180 < minimum_turn_percentage){
	percent_from_180 = minimum_turn_percentage;
}


//Flock behavior code
for(var i = 0; i < parent_flock.count; i++){
	cohesion_x += parent_flock.boids_array[i].phy_position_x - global_x;
	cohesion_y += parent_flock.boids_array[i].phy_position_y - global_y;
	var align_x = dcos(parent_flock.boids_array[i].phy_rotation);
	var align_y = dsin(parent_flock.boids_array[i].phy_rotation);
	var align_len = vectorLength(align_x,align_y);
	//align_x /= align_len ;
	//align_y /= align_len ;
	
	alignment_x += align_x*500;
	alignment_y += align_y*500;
	
	//if current object is not me
	if(parent_flock.boids_array[i] != self){
		var dist_x = global_x - parent_flock.boids_array[i].phy_position_x;
		var dist_y = global_y - parent_flock.boids_array[i].phy_position_y;
		var vec_len = vectorLength(dist_x,dist_y) ;
		
		dist_x /= vec_len*vec_len;
		dist_y /= vec_len*vec_len;
		
		separation_x += dist_x*200000;
		separation_y += dist_y*200000;
	}
}

cohesion_x /= parent_flock.count;
cohesion_y /= parent_flock.count;
alignment_x /= parent_flock.count;
alignment_y /= parent_flock.count;
separation_x /= parent_flock.count;
separation_y /= parent_flock.count;

follow_x = Player.phy_position_x - global_x;
follow_y = Player.phy_position_y - global_y;

var dist_to_player = vectorLength(follow_x,follow_y);

if(dist_to_player > targetting_radius){
	follow_x = 0;
	follow_y = 0;
}

target_x = global_x + (follow_weight*follow_x) + (cohesion_weight*cohesion_x) + (separation_weight*separation_x) + (alignment_weight*alignment_x);
target_y = global_y + (follow_weight*follow_y) + (cohesion_weight*cohesion_y) + (separation_weight*separation_y) + (alignment_weight*alignment_y);

//Steering behavior
var target_forward = false;
var target_behind = false;
steer_left = dot_product(left_side_delta_x,left_side_delta_y,left_vec_x,left_vec_y) < 0;
steer_right = dot_product(right_side_delta_x,right_side_delta_y,left_vec_x,left_vec_y) > 0;
target_forward = dot_product(delta_x,delta_y,dir_x,dir_y) > 0;
	
//If target is to the right of unit	
if(steer_right){
	physics_apply_torque(thruster_Torque*percent_from_180);
	
}
//If target is to the left of unit
else if(steer_left){
	physics_apply_torque(-thruster_Torque*percent_from_180);
}
//if target is forward of unit
if(target_forward){
	physics_apply_local_force(0,0,thruster_Force*percent_away,0);
}


if(isDampenerOn){
	var dampMultiplier = 2.0;
	var deadzone = 0.3;
	
	//if Rotating clockwise and player is on the left
	if(steer_left){
		if(phy_angular_velocity > deadzone){
			physics_apply_torque(-thruster_Torque*dampMultiplier);
		}
	}
	else if(steer_right)
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
	if(!target_forward){
		if(phy_speed > 0){
			var length = sqrt((phy_linear_velocity_x*phy_linear_velocity_x) + (phy_linear_velocity_y *phy_linear_velocity_y));
			var normal_x = phy_linear_velocity_x/length;
			var normal_y = phy_linear_velocity_y/length;
			var magnitude = -thruster_Force;

			//physics_apply_force(phy_com_x,phy_com_y,normal_x*magnitude,normal_y*magnitude);
		}
	}
	
	
}

firing_timer ++;
if(firing_timer >= firing_timer_limit){
	firing_timer = 0;
	var local_x =   (1) * sprite_width * dcos(phy_rotation);
	var local_y =   (1) * sprite_height * dsin(phy_rotation);
	var bullet = instance_create_layer(global_x + local_x,global_y + local_y,"Instances",Enemy_Bullet);
	bullet.phy_rotation = phy_rotation;
}


