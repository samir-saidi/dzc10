// if the player collides with a ghost
health--;				// reduce the players health
with(other){			// destroy the ghost
	instance_destroy();
}