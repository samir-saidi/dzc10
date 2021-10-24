/// @description
part_particles_create(Sname, x, y, particle1, 1);

x+= (target.x -x)*0.2;
y+=((target.y-2/*-32*/)-y)*0.2;

if(distance_to_point(target.x,target.y)<=0){
	instance_destroy();
	part_system_destroy(Sname);

	//obj_player1.x = target.x;
	//obj_player1.y = target.y;

}



	