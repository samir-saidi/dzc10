// draw the player
draw_self();


/*
// debug squares - show the corners of the sprite and its origin
draw_set_colour(c_black);
draw_rectangle(x-(sprite_get_width(sprite_index)/2)-5,y-sprite_get_height(sprite_index)-1-5,x-(sprite_get_width(sprite_index)/2)+5,y-sprite_get_height(sprite_index)-1+5,false);
draw_rectangle(x+(sprite_get_width(sprite_index)/2)-5,y-sprite_get_height(sprite_index)-1-5,x+(sprite_get_width(sprite_index)/2)+5,y-sprite_get_height(sprite_index)-1+5,false);
draw_rectangle(x-(sprite_get_width(sprite_index)/2)-5,y-1-5,x-(sprite_get_width(sprite_index)/2)+5,y-1+5,false);
draw_rectangle(x+(sprite_get_width(sprite_index)/2)-5,y-1-5,x+(sprite_get_width(sprite_index)/2)+5,y-1+5,false);


draw_set_colour(c_blue);
draw_rectangle(x-5,y-5,x+5,y+5,false);

// */