vsp = vsp + grav;

//horizontal collision

if (place_meeting (x+hsp, y, obj_wall))
{
while(!place_meeting(x+sign(hsp), y, obj_wall)){
	
x=x+sign(hsp);
}
hsp = -hsp;
}

x= x+ hsp;

//vertical collision

if (place_meeting (x, y+vsp, obj_wall))
{
while(!place_meeting(x, y+sign(vsp), obj_wall)){
y=y+sign(vsp);
}
vsp = 0;
}

y= y+ vsp;

//Animation

if (!place_meeting (x, y+1, obj_wall)) {
	sprite_index = spr_enemy_walk;
	image_speed = 0;
	if(sign(vsp)>0) sprite_index = spr_enemy_fall; else sprite_index = spr_enemy_jump;
			
}

else

{
	
	image_speed= 1;
	if (hsp == 0)
	{
		sprite_index = spr_enemy_idle
		
	}
	
	else
	
	{
		
		sprite_index = spr_enemy_walk;
	

	}
}