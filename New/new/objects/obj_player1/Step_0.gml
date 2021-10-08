if ((keyboard_check(vk_right)) && place_free(x + clspd, y)) {
	x += spd;
	//image_speed = spd/3; //for when we add animated sprites
	//sprite_index = sprite_here //for when we add animated sprites
}

if ((keyboard_check(vk_left)) && place_free(x - clspd, y)) {
	x -= spd;
	//image_speed = spd/3; //for when we add animated sprites
	//sprite_index = sprite_here //for when we add animated sprites
}

//check for ground
if (place_meeting(x, y+1, obj_solid)) {
    vspd = 0;
    //jumping
    if (keyboard_check(vk_up)) {
        vspd = -jspd;
        }
    }
else {
//gravity
if (vspd < 10) {
    vspd += grav;
    }
}

// check if not moving, or if key was released
if (keyboard_check(vk_nokey) || keyboard_check_released(vk_right) || keyboard_check_released(vk_left)) {
    hspd = 0;
    }
	
if (keyboard_check(vk_shift)) {
	spd = 12;
}

// Horizontal collision
if (place_meeting(x+hspd, y, obj_solid)) {
    while (!place_meeting(x+sign(hspd), y, obj_solid)) {
         x += sign(hspd);
         }
    hspd = 0;	
}

//move horizontally
x += hspd;

// vertical collision
if (place_meeting(x, y+vspd, obj_solid)) {
    while (!place_meeting(x, y+sign(vspd), obj_solid)) {
		y += sign(vspd);
    }
	vspd = 0;
}

y += vspd;