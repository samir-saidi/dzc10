//if(!visible)return 0;

key_right = keyboard_check(ord("D"));
key_up = keyboard_check(ord("W"));
key_left = keyboard_check(ord("A"));
key_down = keyboard_check(ord("S"));

//Animate walking sprite
if (key_left || key_right)
{
	sprite_index = spr_p1_walk;
}
else if (keyboard_check(vk_nokey))
{
	sprite_index = spr_p1_idle;
}

//Animate jumping sprite
if (!place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,obj_moving_platform1))
{
	if (sign(vsp) > 0)
	{
		sprite_index = spr_p1_fall;
	} else if (sign(vsp) < 0) {
		sprite_index = spr_p1_jump;
	}
}

//Set Horizontal move speed, and initate move variable
move = key_right - key_left;
hsp = move * movespeed + hsp_carry;
hsp_carry=0

//Flips the image based on which way you are facing
if(move!=0) 
	image_xscale = move;

//water check
if(!place_meeting(x, y, obj_water))
{	
	grav = gravity_normal;
	are_we_in_water=false;
}	
else if (place_meeting(x,y,obj_water))
{
	
	grav = gravity_swimming;
	vsp = lerp(vsp, 0, 0.01);
	
	if(!are_we_in_water)
	{
		vsp /= 4;
	}
	are_we_in_water=true;
}
 if(are_we_in_water && key_up)
{
	vsp = key_up *  (jumpspeed/3);		//jumping in water
}


//Allows you to jump when standing on a platform
if(place_meeting(x,y+1, obj_wall) || place_meeting(x,y+1, obj_moving_platform1) || place_meeting(x,y+1, obj_pushable_block)) and key_up{
	
	vsp = jumpspeed;		//jumping mechanic
}

//gravity
if(vsp < 10) 
{
	vsp += grav;
}

	


//moving platform collision;
var _movingPlatform = instance_place(x,y+max(1, vsp), obj_moving_platform1);
if(_movingPlatform!=noone && bbox_bottom>_movingPlatform.bbox_top)
{
		if(vsp>0)
		{
	        while(!place_meeting(x, y + sign(vsp), obj_moving_platform1))
	        {
	            y+=sign(vsp);    
	        }
			vsp=0;
		}
		x+=_movingPlatform.move_x;
		y+=_movingPlatform.move_y;
}

//WALL + MOVING PLATFORM COLLISION
var block_on_movingPlatform = instance_place(x,y+max(1, vsp), obj_pushable_block);
if(block_on_movingPlatform!=noone && bbox_bottom>block_on_movingPlatform.bbox_top)
{
    if(vsp>0)
    {
        while(!place_meeting(x, y + sign(vsp), obj_pushable_block))
        {
            y+=sign(vsp);    
        }
        vsp=0;
    }

    x+=block_on_movingPlatform.hsp_carry;
    y+=block_on_movingPlatform.vsp_carry;
}
else
{
	scr_push_p1();
}

//HORIZONTAL COLLISION WITH DOORS AND WALLS
if(place_meeting(x+hsp, y, obj_wall))
{
	while(!place_meeting(x+sign(hsp), y, obj_wall))
	{
		x+=sign(hsp);	
	}
	hsp = 0;	
}
else if(place_meeting(x+hsp, y, obj_door))
{
	while(!place_meeting(x+sign(hsp), y, obj_door))
	{
		x+=sign(hsp);	
	}
	hsp = 0;	
}

x+= hsp;


//VERTICAL COLLISION WITH DOORS AND WALLS

if(place_meeting(x, y+vsp, obj_wall))
{
	while(!place_meeting(x, y+sign(vsp), obj_wall))
	{
		y= y + sign(vsp);
	}
	vsp = 0;	
}
else if(place_meeting(x, y+vsp, obj_door))
{
	while(!place_meeting(x, y+sign(vsp), obj_door))
	{
		y= y + sign(vsp);	
	}
	vsp = 0;
}
	y+= vsp;




//Code to use ladders

if (place_meeting( x,y, obj_ladder))
{
	if(key_up)
	{
		vsp = -2;
		sprite_index=spr_p1_climb;
	}
	else if(key_down)
	{
		sprite_index=spr_p1_climb;
		vsp = 2;
	}
}

//PORTAL COLLISION AND USAGE
var pad, dest;
pad=instance_place(x,y,obj_pad_portal);
if(place_meeting(x, y, pad) && pad != noone)
{
	if(keyboard_check_pressed(ord("E")))
	{
		for(i=0;i<instance_number(obj_dest_portal);i++)
		{
			dest = instance_find(obj_dest_portal, i);
			if(pad.index==dest.index)
			{

				pad.sprite_index = spr_pad_portal_end;
				pad.image_index = 0;
				x=dest.x;
				y=dest.y;
				//visible = false;
				break;
			}
		}
	}
}
