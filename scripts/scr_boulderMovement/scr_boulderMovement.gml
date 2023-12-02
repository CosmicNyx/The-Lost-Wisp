// scr_boulderMovement script
function scr_boulderMovement() {
    var spd = 4; // Speed of movement
    var continue_moving = true;

    while (continue_moving) {
        // Move the boulder down
        y += spd;

        // Check if the boulder has hit an obstacle (e.g., obj_wall)
        if (place_meeting(x, y + spd, obj_wall)) {
            continue_moving = false; // Stop the loop
        }

        // Additional boulder movement logic if needed
        // ...
    }
}
