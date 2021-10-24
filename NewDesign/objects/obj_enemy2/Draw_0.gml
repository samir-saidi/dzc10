/// @description ???
draw_self();

if (flash > 0)

{

flash --;
shader_set(shwhite);
draw_self();
shader_reset();

}