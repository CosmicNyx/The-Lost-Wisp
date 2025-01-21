function scr_playerMovement(direction) {
    var spd = 4; // Speed of movement
    var player_moved = false;
    var boulder_moved = false;
    var continue_moving = true;
    var hit_exit = false; // Flag to check if the player hits the exit
    var loop_counter = 0;
    var max_loops = 100; // Safety counter for infinite loop prevention

    while (continue_moving && loop_counter < max_loops) {
        loop_counter++;
        player_moved = false;
        boulder_moved = false;

        // Move boulders
        with (instance_nearest(x, y, obj_boulder)) {
            if (!place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_wall) &&
                !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_exit)) {
                x += lengthdir_x(spd, direction);
                y += lengthdir_y(spd, direction);
                boulder_moved = true;
            }
        }

        // Move the player
        if (!place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_wall) &&
            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_boulder) &&
            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_crackedWall)) {
            x += lengthdir_x(spd, direction);
            y += lengthdir_y(spd, direction);
            player_moved = true;
        }

        // Handle player-object interactions
        if (place_meeting(x, y, obj_boulder)) {
            global.playerHit = true;
            continue_moving = false;
        } else if (place_meeting(x, y, obj_star)) {
            with (instance_place(x, y, obj_star)) instance_destroy();
            global.playerScore += 1;
        } else if (place_meeting(x, y, obj_iceElement)) {
            with (instance_place(x, y, obj_iceElement)) instance_destroy();
            global.hasIcePower = true;
        } else if (place_meeting(x, y, obj_exit)) {
            hit_exit = true;
            break;
        }

        // Destroy cracked walls hit by boulders
        with (instance_nearest(x, y, obj_boulder)) {
            if (place_meeting(x, y, obj_crackedWall)) {
                with (instance_place(x, y, obj_crackedWall)) instance_destroy();
            }
        }

        // Exit the loop if neither the player nor the boulder moved
        if (!player_moved && !boulder_moved) continue_moving = false;
    }

    if (loop_counter >= max_loops) show_debug_message("Safety counter triggered.");

    // Handle room transitions
    if (global.playerHit || hit_exit) {
        room_goto(room); // Restart the current room
    }
}
