// ----------------------------------------------
// General
// ----------------------------------------------
void showText(int allign, int size, color textC, String text, int posX, int posY) {
    pushStyle();

    textAlign(allign);
    textSize(size);
    fill(textC);
    text(text, posX, posY);
}


void showScore(int x, color textColor, int score) {
    pushStyle();

    String text = "Score: "+ (score);
    showText(CENTER, 20, textColor, text, x, 30);
}


void removeItemIfEaten(ArrayList<Integer> playerX, ArrayList<Integer> playerY, ArrayList<Integer> itemX, ArrayList<Integer> itemY) {
    int eaten = playerAteFood(playerX, playerY, itemX, itemY);
    if (eaten != -1) removeItem(itemX, itemY, eaten);
}


// ----------------------------------------------
// Blocks
// ----------------------------------------------
void addItemCords(ArrayList<Integer> itemX, ArrayList<Integer> itemY, int loopMax) {
    itemX.clear();
    itemY.clear();

    if (itemX.size() != loopMax)
        for (int i = 0; i < loopMax; i++) {
            itemX.add(randomBlockCord(takenBlocksY(), blocksX));
            itemY.add(randomBlockCord(takenBlocksX(), blocksY));
        }
    
    // itemY.add(randomBlockCord(takenBlocksY(), blocksY));
}


// ----------------------------------------------
// block cordinates
// ----------------------------------------------
int randomBlockCord(ArrayList<Integer> except, int max) {
    int newCord = (int) random(0, max);

    while (except.contains(newCord)) {
        newCord = (int) random(0, max);
    }

    return newCord;
}

ArrayList<Integer> takenBlocksX() {
    ArrayList<Integer> takenBlocksX = new ArrayList<Integer>();

    takenBlocksX.addAll(centOneSizeX);
    takenBlocksX.addAll(centTwoSizeX);
    takenBlocksX.addAll(chameleonX);
    takenBlocksX.addAll(bananaX);
    takenBlocksX.addAll(kersX);

    return takenBlocksX;
}

ArrayList<Integer> takenBlocksY() {
    ArrayList<Integer> takenBlocksY = new ArrayList<Integer>();

    takenBlocksY.addAll(centOneSizeY);
    takenBlocksY.addAll(centTwoSizeY);
    takenBlocksY.addAll(chameleonY);
    takenBlocksY.addAll(bananaY);
    takenBlocksY.addAll(kersY);

    return takenBlocksY;
}



// ----------------------------------------------
// Game Over
// ----------------------------------------------
boolean outOfBoard(ArrayList<Integer> playerX, ArrayList<Integer> playerY) {
    boolean state = false;

    if (playerX.get(0) < 0 || playerY.get(0) < 0 || playerX.get(0) >= blockWH || playerY.get(0) >= blockWH) {
        state = true;
    }

    return state;
}


// can't walk
void cantWalkGround(String doThis, int playerX, int playerY) {
    pushStyle();

    switch (doThis) {
        case "add":
            cantWalkGroundX.add(playerX);
            cantWalkGroundY.add(playerY);
            break;

        case "clear":
            cantWalkGroundX.clear();
            cantWalkGroundY.clear();
            break;

        case "draw":
            fill(#00FFDB);

            for (int i = 0; i < cantWalkGroundX.size(); i++) 
                rect(cantWalkGroundX.get(i) * blocksX, cantWalkGroundY.get(i) * blocksY, blockWH, blockWH);
            break;

    }

}













