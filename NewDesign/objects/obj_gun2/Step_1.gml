/// @description ???
x= obj_player2.x+6;
y= obj_player2.y+5;

image_angle = point_direction(x,y, mouse_x, mouse_y) 

firingdelay = firingdelay - 1;
recoil = max(0,recoil-1);
if (mouse_check_button(mb_left)) and (firingdelay < 0)
{
recoil = 4;	
firingdelay = 5;
with (instance_create_layer(x,y, "Bullets", obj_bullet))
	{
		speed = 25;
		direction = other.image_angle;
		image_angle = direction;
		
	}

}

x = x - lengthdir_x (recoil, image_angle);
y = y - lengthdir_y (recoil, image_angle);