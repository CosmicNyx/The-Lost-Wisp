function show_score_page() {
    // Display the player's score
    // This could transition to a new room, show a GUI element, etc.
    draw_text(100, 100, "Score: " + string(global.playerScore));
    // Add any additional logic for ending the level or transitioning
}
