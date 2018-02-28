/// @description Insert description here
// You can write your code in this editor
camera_Zoom -= zoom_Speed;
if(camera_Zoom < zoom_MIN)
{
	camera_Zoom = zoom_MIN;
}