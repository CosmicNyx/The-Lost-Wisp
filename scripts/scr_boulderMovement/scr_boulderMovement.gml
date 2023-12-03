//function scr_boulderMovement(direction) {
//    var spd = 4; // Speed of movement
//    var player_moved = false;
//    var boulder_moved = false;
//    var continue_moving = true;

//    while (continue_moving) {
//        player_moved = false;
//        boulder_moved = false;

//        // Handle boulder movement
//        with (obj_boulder) {
//            // Move the boulder if no wall or cracked wall is in front
//            if (!place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_wall) &&
//                !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_crackedWall)) {
//                x += lengthdir_x(spd, direction);
//                y += lengthdir_y(spd, direction);
//                boulder_moved = true;

//                // Check if boulder hits water
//                if (place_meeting(x, y, obj_water)) {
//                    sprite_index = spr_ice;
//					instance_destroy();
//                    break; // Exit the boulder's code block
//                }
//            }

//            // Check if boulder lands on the player
//            if (place_meeting(x, y, other.id)) {
//                // Boulder has landed on the player
//                global.playerHit = true; // Set the flag to true
//                continue_moving = false; // Stop the loop
//                break; // Exit the boulder's code block
//            }

//            // Check if boulder hits a cracked wall
//            else if (place_meeting(x, y, obj_crackedWall)) {
//                var hit_wall = instance_place(x, y, obj_crackedWall);
//                if (hit_wall) {
//                    with (hit_wall) {
//                        instance_destroy(); // Destroy the cracked wall
//                    }
//                }
//            }
//        }

//        // Move the player if no wall, boulder, or cracked wall is in front
//        if (!place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_wall) && 
//            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_boulder) &&
//            !place_meeting(x + lengthdir_x(spd, direction), y + lengthdir_y(spd, direction), obj_crackedWall)) {
//            x += lengthdir_x(spd, direction);
//            y += lengthdir_y(spd, direction);
//            player_moved = true;

//            // Check if player hits water
//            if (place_meeting(x, y, obj_water)) {
//                if (global.hasIcePower) {
//                    // Player can pass over water, turning it into ice
//                    with (instance_place(x, y, obj_water)) {
//                        sprite_index = spr_ice; // Assuming you have an ice sprite
//                    }
//                } else {
//                    // Player gets stuck in water, speed set to 0
//                    spd = 0; // Set player speed to 0
//                    break; // Player stops at the water edge 
//            }
//        }

//        // Check for collision with a star
//        if (place_meeting(x, y, obj_star)) {
//            with (instance_place(x, y, obj_star)) {
//                instance_destroy(); // Destroy the star
//            }
//            global.playerScore += 1; // Increment score
//        }

//        // Check for collision with an ice element
//        if (place_meeting(x, y, obj_iceElement)) {
//            with (instance_place(x, y, obj_iceElement)) {
//                instance_destroy(); // Destroy the ice element
//            }
//            global.hasIcePower = true; // Grant ice powers
//        }

//        // If neither the player nor the boulder moved, exit the loop
//        if (!player_moved && !boulder_moved) {
//            continue_moving = false;
//        }
//    }

//    // Check if the player was hit by the boulder
//    if (global.playerHit) {
//        // Perform action when the player is hit
//        room_goto(Room1); // Restart the current room
//    }
//}
