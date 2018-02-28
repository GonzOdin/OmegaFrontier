/// @description Insert description here
// You can write your code in this editor
if(steer_left)
{
	draw_text(0,0,"LEFT");
}
else if(steer_right)
{
	draw_text(0,0,"RIGHT");
}
else
{
	draw_text(0,0,"NEUTRAL");
}
//draw_text(0,15,delta_magnitude);
