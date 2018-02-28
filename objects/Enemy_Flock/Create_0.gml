/// @description Insert description here
// You can write your code in this editor
var spawn_x = 0;
var spawn_y = 0;

count = 5;

boids_array = array_create(count);

flock_center_x = 0;
flock_center_y = 0;

flock_target_x = 0;
flock_target_y = 0;

flock_avg_dir_x = 0;
flock_avg_dir_y = 0;

flock_steering_x = 0;
flock_steering_y = 0;

flock_alignment_weight = 0.5;
flock_cohesion_weight = 0.5
flock_separation_weight = 0.5;

for(var i = 0; i < count; i++;)
{
	spawn_x = random_range(bbox_left,bbox_right);
	spawn_y = random_range(bbox_top,bbox_bottom);
	boids_array[i] = instance_create_layer(spawn_x,spawn_y,"Instances",Enemy);
	boids_array[i].parent_flock = object_index; 
}