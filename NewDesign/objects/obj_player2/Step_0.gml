key_right = keyboard_check(vk_right) || keyboard_check(ord("H"));
key_up = keyboard_check(vk_up) || keyboard_check(ord("T")) ;
key_left = keyboard_check(vk_left) || keyboard_check(ord("F"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("G"));

if (key_left || key_right)
{
	sprite_index = spr_p2_walk;
}
else
{
	sprite_index = spr_p2_idle;
}





move = key_right - key_left;
hsp = move * movespeed;
if(move!=0) image_xscale = move;
//water check
if(place_meeting(x, y, obj_water))
{	
	grav = gravity_swimming;
	vsp = lerp(vsp, 0, 0.01);
	//state
	
	if(!are_we_in_water)
	{
		vsp /= 4;
		//instance_create_layer(x,y,"Effects" , obj_effect_splash);
	}
	are_we_in_water=true;
	

}	
else
{
	grav = gravity_normal;
	are_we_in_water=false;
}



if(place_meeting(x,y+1, obj_wall)||place_meeting(x,y+1, obj_moving_platform1)){
	
	if(are_we_in_water){ vsp = key_up*-(jumpspeed/3);}
	else{vsp = key_up * - jumpspeed;}		//jumping mechanic
}
else if(are_we_in_water&&key_up)
{
	vsp = key_up * - (jumpspeed/3);		//jumping in water
}
//*/
if(vsp < 10) vsp += grav;			//gravity


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
	scr_push_p2();
}


scr_move(hsp,vsp);

if (!place_meeting(x,y+1,obj_wall) && !place_meeting(x,y+1,obj_moving_platform1))
{
	if (sign(vsp) > 0)
	{
		sprite_index = spr_p2_fall;
	} else if (sign(vsp) < 0) {
		sprite_index = spr_p2_jump;
	}
}

//portal system
var pad, dest;
pad=instance_place(x,y,obj_pad_portal);
if(place_meeting(x, y, pad))
{
	if(keyboard_check_pressed(ord("I")))
	{
		for(i=0;i<instance_number(obj_dest_portal);i++)
		{
			dest = instance_find(obj_dest_portal, i);
			if(pad.index==dest.index)
			{
				
			//	effect = instance_create_depth(x,y,-1,obj_effect);
			//	effect.target=dest;
				x=dest.x;
				y=dest.y;
				//visible = false;
				break;
			}
		}
	}
}