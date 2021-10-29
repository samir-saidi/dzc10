/// @description 
camera_set_view_pos(view_camera[0], xpos, 180);
xpos = max(xpos-0.3, 0); //animation speed

if(!fadeout)
{
	a =max(a-0.01, 0.25);	
}
else
{
	a = min(a + 0.025, 1);	
}

l += 0.25; //text speed

print = string_copy(str,1,l);

if((l > string_length(str)+50) && (next<array_length_1d(strings)-1))
{
	l = 0;
	next++;
	if(next==array_length_1d(strings)-1)
	{
		holdspace=80;
	}
}

str = strings[next];

if(xpos<1) xpos = 640;
if(keyboard_check_direct(vk_space))
{
	holdspace++	
}
if(holdspace>80)
{
	fadeout = 1;
}
if(a==1) && (fadeout=1) room_goto(Rm_lvl_2);