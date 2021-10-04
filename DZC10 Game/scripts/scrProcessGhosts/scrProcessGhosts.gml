function scrProcessGhosts() {
	var xx,yy,c1,c2;											// temp var only for use in this script

	hspd = dir * spd;											// find out how far the object has moved
	x+=hspd;													// apply the distance to the object

	if(dir == -1){												// if moving left
		image_index = 1;										// set the sprite to point the correct way
		c1 = -1;												// reset the collision tile checkers
	    c2 = -1;
	    c1 = tilemap_get_at_pixel(oGame.map, x, y);				// check the left edge of the sprite
	    c2 = tilemap_get_at_pixel(oGame.map,x,y+sprite_height);				// check below the left edge of the sprite, since ghosts dont like heights
	    if((c1 >= 1) || (c2 <= 0)){								// if there is something blocking the left or if there would be a fall to the left
	        x = (x&$ffffffc0)+sprite_width;						// move the object to the edge of the tile
			dir *= -1;											// change the direction
	    }
	}else if(dir == 1)											// if moving right
	{															// Otherwise, check collision to the right
		image_index = 0;										// set the sprite to point the correct way
		c1 = -1													// reset the collision tile checkers
	    c2 = -1;
	    c1 = tilemap_get_at_pixel(oGame.map,x+sprite_width,y);					// check the right edge of the sprite
	    c2 = tilemap_get_at_pixel(oGame.map,x+sprite_width,y+sprite_height);	// check below the right edge of the sprite, since ghosts dont like heights
		if((c1 >= 1) || (c2 <= 0)){								// if there is something blocking the right or if there would be a fall to the right
		    x = (x&$ffffffc0);									// move the object to the edge of the tile || $ffffffc0 rounds the position to the nearest 64
			dir *= -1;											// change the direction
		}
	}






}
