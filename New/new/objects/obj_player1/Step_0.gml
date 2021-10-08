// movement
rkey = keyboard_check(vk_right);
lkey = keyboard_check(vk_left);
jkey = keyboard_check(vk_up);

//check for ground
if (place_meeting(x, y+1, obj_solid))
    {
    vspd = 0;
    //jumping
    if (jkey)
        {
        vspd = -jspd;
        }
    }
else
{
//gravity
if (vspd < 10)
    {
    vspd += grav;
    }
}


// moving right
if (rkey)
    {
    hspd = spd;
    }
// moving left
if (lkey)
    {
    hspd = -spd;
    }
// check if not moving
if ((!!rkey && !!lkey) || (rkey && lkey))
    {
    hspd = 0;
    }
	
//check if key was released
if (keyboard_check_released(vk_right) || keyboard_check_released(vk_left))
	{
	hspd = 0;
	}

// Horizontal collision
if (place_meeting(x+hspd, y, obj_solid))
    {
    while (!place_meeting(x+sign(hspd), y, obj_solid))
         {
         x += sign(hspd);
         }
    hspd = 0;
	
    }
if (place_meeting(x+hspd, y, obj_button))
    {
    while (!place_meeting(x+sign(hspd), y, obj_button))
         {
         x += sign(hspd);
         }
    hspd = 0;
	butt_press = 1;
    }
else if (!place_meeting(x+sign(hspd), y, obj_button))
{
	butt_press=0;
}
//move horizontally
x += hspd;


// vertical collision
if (place_meeting(x, y+vspd, obj_solid))
{
    while (!place_meeting(x, y+sign(vspd), obj_solid))
	{
		y += sign(vspd);
    }
	vspd = 0;
}
if (place_meeting(x, y+vspd, obj_button))
{
    while (!place_meeting(x, y+sign(vspd), obj_button))
	{
		y += sign(vspd);
    }
	vspd = 0;
	butt_press = 1;
}
else if (!place_meeting(x, y+sign(vspd), obj_button))
{
	butt_press=0;
}
//move vertically
y += vspd;
