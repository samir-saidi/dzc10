/// @description 
if(keyboard_check_pressed(ord("E"))) && (!instance_exists(obj_text))
{
	with(instance_create_layer(x,y-64, layer, obj_text))
	{
		text = other.text;
		length=string_length(text);
	}
}