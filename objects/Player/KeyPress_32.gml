/// @description Insert description here
// You can write your code in this editor


var local_x =   (0.5) * sprite_width * dcos(phy_rotation);
var local_y =   (0.5) * sprite_height * dsin(phy_rotation);
instance_create_layer(x + local_x,y + local_y,"Instances",Player_Bullet);