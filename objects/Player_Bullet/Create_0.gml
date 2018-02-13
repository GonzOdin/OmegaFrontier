/// @description Insert description here
// You can write your code in this editor
phy_fixed_rotation = true;

phy_rotation = Player.phy_rotation;
//phy_linear_velocity_x = dcos(phy_rotation+90) * -100000;
//phy_linear_velocity_y = dsin(phy_rotation+90) * -100000;
phy_bullet = true;
physics_apply_local_force(0,0,0,-100);