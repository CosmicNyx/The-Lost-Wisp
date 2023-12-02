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
            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_boulder)) {
            x += lengthdir_x(spd, direction);
            y += lengthdir_y(spd, direction);
            player_moved = true;
        }

        // Check if boulder lands on the player
        with(obj_boulder) {
            if (place_meeting(x, y, other.id)) {
                // Boulder has landed on the player
                global.playerHit = true; // Set the flag to true
                continue_moving = false; // Stop the loop
                break; // Exit the boulder's code block
            }
        }

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
