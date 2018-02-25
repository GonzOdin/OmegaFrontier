/// @description Insert description here
// You can write your code in this editor
var spawn_x = 0;
var spawn_y = 0;
var count = 1;

for(var i = 0; i < count; i++;)
{
	spawn_x = random_range(bbox_left,bbox_right) + bbox_left;
	spawn_y = random_range(bbox_bottom,bbox_top) + bbox_top;
	var instance = instance_create_layer(spawn_x,spawn_y,"Instances",Enemy);
	//instance.image_xscale *= 0.5;
	//instance.image_yscale *= 0.5;
}