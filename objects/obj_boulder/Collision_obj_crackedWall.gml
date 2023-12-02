// Handle collision with cracked wall
with(instance_place(x, y, obj_crackedWall)) {
    instance_destroy(); // Destroy the cracked wall
}

