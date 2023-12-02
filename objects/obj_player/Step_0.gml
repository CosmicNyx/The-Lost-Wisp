// Check for keyboard inputs and move
if (keyboard_check_pressed(vk_up)) {
    if (debug_mode) {
        show_debug_message("Up key pressed");
    }
    script_execute(scr_playerMovement, 90);
}
if (keyboard_check_pressed(vk_down)) {
    if (debug_mode) {
        show_debug_message("Down key pressed");
    }
    script_execute(scr_playerMovement, 270);
}
if (keyboard_check_pressed(vk_left)) {
    if (debug_mode) {
        show_debug_message("Left key pressed");
    }
    script_execute(scr_playerMovement, 180);
}
if (keyboard_check_pressed(vk_right)) {
    if (debug_mode) {
        show_debug_message("Right key pressed");
    }
    script_execute(scr_playerMovement, 0);
}
