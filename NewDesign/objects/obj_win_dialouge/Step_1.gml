/// @description Insert description here
// You can write your code in this editor
if(!instance_exists(obj_text))
{
	with(instance_create_layer(x,y-32, layer, obj_text))
	{
		text = other.text;
		length=string_length(text);
	}
	readYetP1 = true;
}