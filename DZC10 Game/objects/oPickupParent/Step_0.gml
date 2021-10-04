deg_height += 10;								// sets the speed of the bounce
if(deg_height > 360){							// check if the bounce counter has gone over its max
	deg_height -= 360;							// if it has then loop it around
}
deg_shrink += 3;								// sets the speed of the shrink
if(deg_shrink > 360){							// check if the shrink counter has gone over its max
	deg_shrink -= 360;							// if it has then loop it around
}
y = y_orig+sin(degtorad(deg_height))*height;	// move the pickup up and down using a sine wave
shrink = 1+sin(degtorad(deg_shrink))*0.1;		// calculate the ammount of shrink the pickup should have using a sine wave
image_xscale = shrink;							// apply shrink to the width
image_yscale = shrink;							// apply shrink to the height