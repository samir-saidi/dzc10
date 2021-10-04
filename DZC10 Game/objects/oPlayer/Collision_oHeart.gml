if(health < 3){				// if the player is not at max health
	health++;				// increase the players health
	with(other){			// destroy the pickup
		instance_destroy();
	}
}