/// @description Insert description here
// You can write your code in this editor
menu_x = x;
menu_y = y;
button_h = 32;
button[0] = "Start Game";
button[1] = "Exit Game";

buttons = array_length_1d(button);
audio_play_sound(Sound2, 1000 , true);

menu_index = 0;
last_selected = 0;
