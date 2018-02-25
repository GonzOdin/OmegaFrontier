/// @description Insert description here
// You can write your code in this editor
if(target_on_left)
{
	draw_text(0,0,"LEFT");
}
else if(target_on_right)
{
	draw_text(0,0,"RIGHT");
}
else
{
	draw_text(0,0,"NEUTRAL");
}
//draw_text(0,15,delta_magnitude);
draw_text(0,30,debug_1);
draw_text(0,45,debug_2);
draw_text(0,60,debug_3);