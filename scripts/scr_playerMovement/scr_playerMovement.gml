// scr_playerMovement script
function scr_playerMovement(direction) {
    var spd = 4; // Speed of movement
    var player_moved = false;
    var boulder_moved = false;
    var continue_moving = true;

    while (continue_moving) {
        player_moved = false;
        boulder_moved = false;

        // Move the boulder if no wall is in front
        with(obj_boulder) {
            if (!place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_wall)) {
                x += lengthdir_x(spd, direction);
                y += lengthdir_y(spd, direction);
                boulder_moved = true;
            }
        }

        // Move the player if no wall or boulder is in front
        if (!place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_wall) && 
            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_boulder)&& 
            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_crackedWall)) {
            x += lengthdir_x(spd, direction);
            y += lengthdir_y(spd, direction);
            player_moved = true;
        }

        // Check if boulder lands on the player
        with(obj_boulder) {
    // Check if boulder lands on the player
    if (place_meeting(x, y, other.id)) {
        // Boulder has landed on the player
        global.playerHit = true; // Set the flag to true
        continue_moving = false; // Stop the loop
        break; // Exit the boulder's code block
    }
    // Check if boulder hits a cracked wall
    else if (place_meeting(x, y, obj_crackedWall)) {
        with(instance_place(x, y, obj_crackedWall)) {
            instance_destroy(); // Destroy the cracked wall
        }
        // Optional: Logic for what happens when boulder breaks the wall
    }
}

		
		// Check for collision with a star
        if (place_meeting(x, y, obj_star)) {
            with (instance_place(x, y, obj_star)) {
                instance_destroy();
            }
            global.playerScore += 1; // Increment score
        }
		
		  // Check for collision with an ice element
        if (place_meeting(x, y, obj_iceElement)) {
            with (instance_place(x, y, obj_iceElement)) {
                instance_destroy();
            }
            global.hasIcePower = true; // Grant ice powers
        }


  // Check for collision with the exit
        //if (place_meeting(x, y, obj_exit)) {
        //    show_score_page(); // Handle exit logic
        //}


        // If neither the player nor the boulder moved, exit the loop
        if (!player_moved && !boulder_moved) {
            continue_moving = false;
        }
    }

    // Check if the player was hit by the boulder
    if (global.playerHit) {
        // Perform the action for when the player is hit
        // For example, restart the level or end the game
        // Replace the following line with your game's specific logic
        room_goto(Room1); // This restarts the current room
    }
}
