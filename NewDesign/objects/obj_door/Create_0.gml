/// @description Insert description here
// You can write your code in this editor
/*

active = false;
start_y = y;

top = start_y;


activate = 1;*/

active = false;
open_door  = function() {
  targetY = yorigin - sprite_height;
  open = true;
}
close_door = function() {
  targetY = yorigin;
  open = false;
}
open     = false;
yorigin  = y;
targetY  = y;