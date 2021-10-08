function scrProcessPlayer() {
	var xx,yy,c1,c2,c3,c4;

	// Apply gravity (and jumping)
	y = y+grav;
	grav+=gravdelta; 
	if( grav>=gravmax ) grav=gravmax;

	/////////////////////
	//    JUMP/FALL    //
	/////////////////////

	if(!jump){									// if we are already jumping dont do anything
		if((keyboard_check(vk_space)) || (gamepad_button_check(0,gp_face1))){
			grav=grav_jump;						// make the player jump
			jump=true;							// flag that we are jumping	
		}
	}

	// check gamepad left stick
	stick_l_h = gamepad_axis_value(0,gp_axislh);// get the horizontal value from the left stick
	stick_l_v = gamepad_axis_value(0,gp_axislv);// get the vertical value from the left stick

	// horizontal movement
	if(stick_l_h < 0){							// if the stick is to the left move left
		move_left = true;
		move_right = false;
	} else if(stick_l_h > 0){					// if the stick is to the right move left
		move_left = false;
		move_right = true;
	} else {									// if it is neither then dont move
		move_left = false;
		move_right = false;
	}
	// vertical movement
	if(stick_l_v < 0){							// if the stick is to the top move up
		move_up = true;
		move_down = false;
	} else if(stick_l_v > 0){					// if the stick is to the bottom move down
		move_up = false;
		move_down = true;
	} else {									// if it is neither then dont move
		move_up = false;
		move_down = false;
	}


	if( grav<0 ){								// If jumping check above player
	    sprite_index = sJump;
	} else {									// otherwise, falling so check UNDER the player
	    if(jump){								// if coming down after jumping display the correct sprite
	        sprite_index = sJumpFall;
	    } else if(fall){						// if falling from an edge display the fall sprite
	        sprite_index = sFall;    
	    } else {								// if not already falling or jumping
			grav = 0;							// first stop falling (used for ladders)
			fall = true;						// flag that we are falling
		}
		// check the points at the bottom of the player character
		c1 = tilemap_get_at_pixel(oGame.map,x-(sprite_get_width(sprite_index)/2),y);	// left
		c2 = tilemap_get_at_pixel(oGame.map,x+(sprite_get_width(sprite_index)/2),y);	// right
		c3 = tilemap_get_at_pixel(oGame.map,x,y);										// center

		if( c1>=1 || c2>=1 || c3 >= 1){			// if they are intersecting with a tile
			if((c1 == 1) || (c2 == 1) || (c3 == 1) || (c1 == 3) || (c2 == 3) || (c3 == 3)){
				// if the tile we are intersecting with cannot be fallen through
				y = real(y&$ffffffc0);			// move the sprite to the top of the tile
				sprite_index = choose(sIdle1);	// set the sprite to the idle sprite
				climbing = false;				// stop any climbing
				jump = false;					// stop any jumping
				fall = false;					// stop any falling
			}
			if((c3 == 2) || (c3 == 2)){			// if we are intersecting with a ladder
				can_climb = true;				// flag that we can climb
			}
		} else {								// if we are not intersecting any tiles
			climbing = false;					// flag that we cannot climb
		}
	}    

	/////////////////////
	//     MOVING      //
	/////////////////////

	if((keyboard_check(vk_left)) || (oGame.button_down_left == true) || (gamepad_button_check(0,gp_padl)) || (move_left)){				// moving left collisions
	    dir=-1;									// set the correct direction
		image_xscale = dir;						// make the sprite face the correct direction
		climbing = false;						// since we are moving left we are not climbing
		can_climb = false;						// and we cannot climb
	    if(!jump && !fall){						// if we are not jumping or falling
	        sprite_index = sWalk;				// set the sprite to walking
	    }
	    x=x-xspeed								// move the player left
	    c2 = -1;
		c3 = -1;
		// check the points at the bottom of the sprite
	    c1 = tilemap_get_at_pixel(oGame.map,x-(sprite_get_width(sprite_index)/2),y-1);				// left
	    c3 = tilemap_get_at_pixel(oGame.map,x,y-1);													// center
	    if( y&$3f>0 ) c2=tilemap_get_at_pixel(oGame.map,x-(sprite_get_width(sprite_index)/2),y+1);	// left below (only check if there is a tile below)
	    if(c1 == 3) || (c2 == 3){																	// if we are intersecting with a box
			x = real(x&$ffffffc0)+(sprite_get_width(sprite_index)/2);								// stop the player from moving
	    }
		if(c3 == 2){							// if we are intersecting with a ladder
			can_climb = true;					// flag that we can climb
		} else {								// if we are not a ladder
			can_climb = false;					// flag we cant climb
			image_speed = anim_speed;			// make sure the animations will play at correct speed
		}
		if(x < 0){								// the the player has moved off the edge of the screen
			x = room_width;						// wrap around to the other side of the screen
		}
	}else if((keyboard_check(vk_right)) || (oGame.button_down_right == true) || (gamepad_button_check(0,gp_padr)) || (move_right)){			// moving right collisions (check with else so that both directions cant be triggered at the same time)
	    dir=1;									// set the correct direction
		image_xscale = dir;						// make the sprte face the correct direction 
		climbing = false;						// set that we are not climbing
		can_climb = false;						// set that we cant climb
	    if(!jump && !fall){						// if we are not jumping or falling
	        sprite_index = sWalk;				// set the sprite to walking
	    }
	    x=x+xspeed;								// move the player right
	    c2 = -1;
		c3 = -1;
		// check the points at the bottom of the sprite
	    c1 = tilemap_get_at_pixel(oGame.map,x+(sprite_get_width(sprite_index)/2),y-1);				// right
		c3 = tilemap_get_at_pixel(oGame.map,x,y-1);													// center
	    if( y&$3f>0 ) c2=tilemap_get_at_pixel(oGame.map,x+(sprite_get_width(sprite_index)/2),y+1);	// right below (only check if there is a tile below)
	    if(c1 == 3) || (c2 == 3){																	// if we are intersecting with a box
				x = real(x&$ffffffc0)+oGame.tilesize-(sprite_get_width(sprite_index)/2);			// stop the player from moving
	    }
		if(c3 == 2){							// if we are intersecting with a ladder
			can_climb = true;					// flag that we can climb
		} else {								// if we are not a ladder
			can_climb = false;					// flag we cant climb
			image_speed = anim_speed;			// make sure the animations will play at correct speed
		}
		if(x > room_width){						// the the player has moved off the edge of the screen
			x = 0;								// wrap around to the other side of the screen
		}
	
	} else if(!can_climb){						// if we are not moving left or right check that we are not climbing
		if(!jump){
			sprite_index = choose(sIdle1,sIdle2);	// set the sprite to one of the idles (choose at random)
		}
		image_speed = anim_speed;				// set the speed of the sprite to the correct level
	}

	/////////////////////
	//    Climbing     //
	/////////////////////

	if(can_climb){									// if we can climb
		c3 = tilemap_get_at_pixel(oGame.map,x,y-1);	// check the bottom center of the sprite
		if(c3 == 2){								// if it is still on a ladder
			if((keyboard_check(vk_up)) || (oGame.button_down_up == true) || (gamepad_button_check(0,gp_padu)) || (move_up)){				// and we are pressing up
				y = y+yspeed;						// move the player up the ladder
				image_index+=0.3;					// manually control which frame of the animation we are on 
				climbing = true;					// flag that we are now climbing
			}
			if((keyboard_check(vk_down)) || (oGame.button_down_down == true) || (gamepad_button_check(0,gp_padd)) || (move_down)){			// or if we are pressing down
				y = y-yspeed;						// move the player down the ladder
				image_index+=0.3;					// manually control which frame of the animation we are on 
				climbing = true;					// flag that we are now climbing
			}
			if(climbing){							// if we are climbing
				jump = false;						// make sure we are not jumping
				fall = false;						// make sure that we are not falling
				sprite_index = sClimb;				// set the sprite to climbing
				image_speed = 0						// stop the animation from playing as we are controlling that manually
				x = real(x&$ffffffc0)+oGame.tilesize-(sprite_get_width(sprite_index)/2);	// make sure that the player stays on the ladder
			}
		} else {									// if we are no longer on a ladder
			can_climb = false;						// flag that we cannot climb
		}
	}






}
