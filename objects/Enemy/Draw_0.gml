/// @description Insert description here
// You can write your code in this editor
draw_self();


if(debug_on){
	draw_line_color(left_side_x,left_side_y,left_side_x+(dir_x*150),left_side_y+(dir_y*150),c_orange,c_orange);
	draw_line_color(left_side_x,left_side_y,left_side_x+left_side_delta_x,left_side_y+left_side_delta_y,c_red,c_red);

	draw_line_color(right_side_x,right_side_y,right_side_x+(dir_x*150),right_side_y+(dir_y*150),c_blue,c_blue);
	draw_line_color(right_side_x,right_side_y,right_side_x+right_side_delta_x,right_side_y+right_side_delta_y,c_white,c_white);
	
	draw_line_color(global_x,global_y,target_x,target_y,c_fuchsia,c_fuchsia);
	
	draw_circle(global_x,global_y,targetting_radius,5);
	
	draw_text(global_x,global_y,debug_1);
	draw_text(global_x,global_y+15,debug_2);
	draw_text(global_x,global_y+30,debug_3);
}
