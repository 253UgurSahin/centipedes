// ----------------------------------------------
// Food
// ----------------------------------------------
// banana
void banana() {
    // Check eaten
    bananaEaten();
    
    // Draw food
    // displayFood(bananaX, bananaY, bananaC);    
}


void bananaEaten() {    
    // player one check
    if (foodEaten(centOneSizeX, centOneSizeY, bananaX, bananaY)) {
        removeItemIfEaten(centOneSizeX, centOneSizeY, bananaX, bananaY);
        // Add score to player
        playerOneScore += foodBanaanScore;
    }

    // Player 2 check
    if (players == 2 && foodEaten(centTwoSizeX, centTwoSizeY, bananaX, bananaY)) {
        removeItemIfEaten(centTwoSizeX, centTwoSizeY, bananaX, bananaY);
        // Add score to player
        playerTwoScore += foodBanaanScore;
    }
}

// ----------------------------------------------
// Kers
// ----------------------------------------------
void kers() {
    // Check eaten
    kersEaten();
    
    // Draw food
    if (players == 1) 
        displayFood(kersX, kersY, kersC);
}

void kersEaten() {
    if (foodEaten(centOneSizeX, centOneSizeY, kersX, kersY)) {
        playerOneScore += foodKersScore;
        shuffleKers();
    }

    // player two eaten kers
    if (players == 2 && foodEaten(centTwoSizeX, centTwoSizeY, kersX, kersY)) {
        playerTwoScore += foodKersScore;
        shuffleKers();
    }
}


void shuffleKers() {
    kersX.clear();
    kersY.clear();

    kersX.add(randomBlockCord(takenBlocksX(), blocksX));
    kersY.add(randomBlockCord(takenBlocksY(), blocksY));
}


// ----------------------------------------------
// Food Functions
// ----------------------------------------------
boolean foodEaten(ArrayList<Integer> playerX, ArrayList<Integer> playerY, ArrayList<Integer> foodX, ArrayList<Integer> foodY) {
    for (int i = 0; i < foodX.size(); i++)
        if (playerX.get(0) == foodX.get(i) && playerY.get(0) == foodY.get(i)) {
            return true;
        }

    return false;
}


int playerAteFood(ArrayList<Integer> playerX, ArrayList<Integer> playerY, ArrayList<Integer> foodX, ArrayList<Integer> foodY) {
    for (int i = 0; i < foodX.size(); i++)
        if (playerX.get(0) == foodX.get(i) && playerY.get(0) == foodY.get(i)) {
            return i;
        }

    return -1;
}


void removeItem(ArrayList<Integer> itemX, ArrayList<Integer> itemY, int i) {
    itemX.remove(itemX.get(i));
    itemY.remove(itemY.get(i));
}


void displayFood(ArrayList<Integer> itemX, ArrayList<Integer> itemY, color blockC) {
    pushStyle();

    fill(blockC);

    if (gamescreen == "starting" || gamescreen == "playing")
        for (int i = 0; i < itemX.size(); i++) ellipse(itemX.get(i) * blocksX + (blockWH / 2), itemY.get(i) * blocksY + (blockWH / 2), blockWH, blockWH);
}

