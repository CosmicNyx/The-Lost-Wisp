function scr_boulderMovement() {
    var spd = 4; // Speed of movement
    var continue_moving = true;

    while (continue_moving) {
        y += spd; // Move the boulder down
        // Stop if hitting a regular wall
        if (place_meeting(x, y + spd, obj_wall)) {
            continue_moving = false; // Stop the loop
        }

    }
	
	
        if (place_meeting(x, y, obj_crackedWall)) {
            with (instance_place(x, y, obj_crackedWall)) {
                instance_destroy(obj_crackedWall);
            }
        }
	
	
}
