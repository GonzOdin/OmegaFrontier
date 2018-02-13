/// @description Insert description here
// You can write your code in this editor
if(isDampnerOn){
	var dampMultiplier = 1.0;
	var deadzone = 0.3;
	//Going clockwise
	if(!isQE_Down){
		if(phy_angular_velocity > deadzone){
			physics_apply_torque(-thruster_Torque*dampMultiplier);
		}
		else if(phy_angular_velocity < -deadzone){
			physics_apply_torque(thruster_Torque*dampMultiplier);
		}
	}
	
	if(!isWASD_Down){
		if(phy_speed > 0){
			var length = sqrt((phy_linear_velocity_x*phy_linear_velocity_x) + (phy_linear_velocity_y *phy_linear_velocity_y));
			var normal_x = phy_linear_velocity_x/length;
			var normal_y = phy_linear_velocity_y/length;
			var magnitude = -thruster_Force;
	
			/*
			vx = (ex - px) = 256
			vy = (ey - py) = -342
			len = sqrt(vx2 + vy2) = sqrt(65536 + 116964) = 427.2
			vx = vx / len = 0.6
			vy = vy / len = 0.8
			*/
			physics_apply_force(phy_com_x,phy_com_y,normal_x*magnitude,normal_y*magnitude);
		}
	}
}



isWASD_Down = false;
isQE_Down = false;