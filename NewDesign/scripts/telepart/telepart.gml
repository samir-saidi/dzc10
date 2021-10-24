// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function telepart(){
	Sname = part_system_create();

	particle1 = part_type_create();
	part_type_sprite(particle1,spr_p1_idle,0,0,0);
	part_type_size(particle1,1,1,0,0);
	part_type_scale(particle1,1,1);
	part_type_alpha3(particle1,1,0.50,0.10);
	part_type_speed(particle1,0,0,0,0);
	part_type_direction(particle1,0,0,0,0);
	part_type_gravity(particle1,0,270);
	part_type_orientation(particle1,0,0,0,0,1);
	part_type_blend(particle1,0);
	part_type_life(particle1,30,30);

}