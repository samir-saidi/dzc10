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
	hsp_carry = _movingPlatform.move_x;
	vsp_carry = _movingPlatform.move_y;
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

scr_move(0,vsp);

//portal system
var pad, dest;
pad=instance_place(x,y,obj_pad_portal);
if(place_meeting(x+1, y, obj_player1)||place_meeting(x-1, y, obj_player2)||place_meeting(x-1, y, obj_player1)||place_meeting(x+1, y, obj_player2))
{
	if(place_meeting(x, y, pad))
	{
		if(keyboard_check_pressed(ord("E"))|| keyboard_check_pressed(vk_rshift))
		{
			for(i=0;i<instance_number(obj_dest_portal);i++)
			{
				dest = instance_find(obj_dest_portal, i);
				if(pad.index==dest.index)
				{
				
				//	effect = instance_create_depth(x,y,-1,obj_effect);
				//	effect.target=dest;
					x=dest.x-32;
					y=dest.y;
					//visible = false;
					break;
				}
			}
		}
	}
}