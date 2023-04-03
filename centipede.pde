// ----------------------------------------------
// centipede
// ----------------------------------------------
void centipede(ArrayList<Integer> playerX, ArrayList<Integer> playerY, color playerColor, int scoreX, int playerScore, boolean playerMayMove, int playerDir) {
    // Centipede color green
    fill(playerColor);

    // Score
    showScore(scoreX, playerColor, playerScore);

    // draw centipede body
    drawCentipede(playerX, playerY);

    if (playerTurn != 0 && playerMayMove) {
        if (frameCount % speed == 0) {
            centipedeBody("move", playerX, playerY, playerDir);
        
            // if out of gameboard
            if (outOfBoard(playerX, playerY)) gamescreen = "gameover";

            // if snake ate itself
            for (int i = 1; i < playerX.size(); i++)
                if (playerX.get(0) == playerX.get(i) && playerY.get(0) == playerY.get(i)) gamescreen = "gameover";

            // check if banana or kers is not eaten to  shorten snake
            if (foodEaten(playerX, playerY, bananaX, bananaY) == false) {                
                if (foodEaten(playerX, playerY, kersX, kersY) == false) 
                    centipedeBody("shorten", playerX, playerY, playerDir);
            }
        }
    }
}


// ----------------------------------------------
// Centipede Functions
// ----------------------------------------------
void addDefBodyparts(int x, ArrayList<Integer> playerX, ArrayList<Integer> playerY) {
    if (playerX.size() != centipedeDefLength)
        for (int i = 0; i < centipedeDefLength; i++) {
            playerX.add(x); 
            playerY.add((blocksY - 1 - centipedeDefLength)  + i); 
        }
}


void drawCentipede(ArrayList<Integer> playerX, ArrayList<Integer> playerY) {
    for (int i = 0; i < playerX.size(); i++) 
        rect(playerX.get(i) * blocksX, playerY.get(i) * blocksY, blockWH, blockWH);
}


void centipedeBody(String doThis, ArrayList<Integer> playerX, ArrayList<Integer> playerY, int playerDir) {
    switch (doThis) {
        case "move":
            // make snake longer in going direction
            playerX.add(0, playerX.get(0) + xDirection[playerDir]); 
            playerY.add(0, playerY.get(0) + yDirection[playerDir]);

            changePlayerTurn();
            break;
        case "shorten":
            // Make snake shorter
            if (checkIfBodyExists(playerX) != true) gamescreen = "gameover";
            playerX.remove(playerX.size() -1); 
            playerY.remove(playerY.size() -1);
            break;
    }
}


boolean centipedeAteHimself(ArrayList<Integer> playerX, ArrayList<Integer> playerY) {
    boolean state = false;

    for (int i = 1; i < playerX.size(); i++) {
        if (playerX.get(0) == playerX.get(i) && playerY.get(0) == playerY.get(i)) {
            state = true;
        }
    }
    
    return state;
}


void changePlayerTurn() {
    if (players == 2) {
        playerMove = false;
        if (playerTurn == 1)    playerTurn = 2;
        else                    playerTurn = 1;
    }
}

boolean checkIfBodyExists(ArrayList<Integer> playerX) {
    // Check if player has body
    if (playerX.size() == 1) return false;
    return true;
}
