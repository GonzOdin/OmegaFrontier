/// @description Insert description here
// You can write your code in this editor


flock_center_x = 0;
flock_center_y = 0;
flock_avg_dir_x = 0;
flock_avg_dir_y = 0;
flock_steering_x = 0;
flock_steering_y = 0;


//Find average direction and average position for all boids
for(var i = 0; i < count; i++;)
{
	flock_center_x += boids_array[i].phy_position_x;
	flock_center_y += boids_array[i].phy_position_y;
	flock_avg_dir_x += dcos(boids_array[i].phy_rotation);
	flock_avg_dir_y += dsin(boids_array[i].phy_rotation);
}

flock_center_x /= count;
flock_center_y /= count;

flock_avg_dir_x /= count;
flock_avg_dir_y /= count;




