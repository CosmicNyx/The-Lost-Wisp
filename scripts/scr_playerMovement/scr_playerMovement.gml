function scr_playerMovement(direction) {
    var spd = 4; // Speed of movement
    var player_moved = false;
    var boulder_moved = false;
    var continue_moving = true;
    var hit_exit = false; // Flag to check if the player hits the exit

    while (continue_moving) {
        player_moved = false;
        boulder_moved = false;

        // Move the boulder if no wall is in front
        with (obj_boulder) {
            if (!place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_wall) &&
                !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_exit)) {
                x += lengthdir_x(spd, direction);
                y += lengthdir_y(spd, direction);
                boulder_moved = true;
            }
        }

        // Move the player if no wall, boulder, or exit is in front
        if (!place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_wall) && 
            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_boulder) && 
            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_crackedWall)) {
            x += lengthdir_x(spd, direction);
            y += lengthdir_y(spd, direction);
            player_moved = true;
        }

        // Check if the player collides with various objects
        // Boulder landing on the player
        with (obj_boulder) {
            if (place_meeting(x, y, other.id)) {
                global.playerHit = true; // Set the flag to true
                continue_moving = false; // Stop the loop
                break; // Exit the boulder's code block
            }
            // Boulder hitting a cracked wall
            else if (place_meeting(x, y, obj_crackedWall)) {
                with (instance_place(x, y, obj_crackedWall)) {
                    instance_destroy(); // Destroy the cracked wall
                }
            }
        }

        // Collision with a star
        if (place_meeting(x, y, obj_star)) {
            with (instance_place(x, y, obj_star)) {
                instance_destroy();
            }
            global.playerScore += 1; // Increment score
        }

        // Collision with an ice element
        if (place_meeting(x, y, obj_iceElement)) {
            with (instance_place(x, y, obj_iceElement)) {
                instance_destroy();
            }
            global.hasIcePower = true; // Grant ice powers
        }

        // Collision with the exit, set hit_exit flag
        if (place_meeting(x, y, obj_exit)) {
			 show_debug_message("Exit collision detected");
            hit_exit = true; // Player reached the exit
			break;
        }

        // Exit the loop if neither the player nor the boulder moved
        if (!player_moved && !boulder_moved) {
            continue_moving = false;
        }
    }

    // If the player was hit by the boulder or reached the exit
    if (global.playerHit || hit_exit) {
        room_goto(Room1); // Restart the current room
    }
}
