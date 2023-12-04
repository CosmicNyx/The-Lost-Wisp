// Check for keyboard inputs and move
if (keyboard_check_pressed(vk_up)) {
    if (debug_mode) {
        show_debug_message("Up key pressed");
    }
    script_execute(scr_playerMovement, 90);
	image_index = 1;

}
if (keyboard_check_pressed(vk_down)) {
    if (debug_mode) {
        show_debug_message("Down key pressed");
    }
    script_execute(scr_playerMovement, 270);
	image_index = 4;

}
if (keyboard_check_pressed(vk_left)) {
    if (debug_mode) {
        show_debug_message("Left key pressed");
    }
    script_execute(scr_playerMovement, 180);
	image_index = 2;

}
if (keyboard_check_pressed(vk_right)) {
    if (debug_mode) {
        show_debug_message("Right key pressed");
    }
    script_execute(scr_playerMovement, 0);
	image_index = 3;

}

depth = -y;

// Example additional logic for ice power interactions
//if (global.hasIcePower) {
    // Ice power specific logic
//}