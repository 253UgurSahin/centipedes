// ----------------------------------------------
// Game over
// ----------------------------------------------
void gameOver() {
    String text = "GAME OVER \n player one Score is: "+ (playerOneScore);
    if (players == 2) { text += "\n player two Score is: " + (playerTwoScore); }
    text += "\n Press ENTER";

    showText(CENTER, 20, 255, text, width/2 - 20, height/3);

    if (keyCode == ENTER) { 
        clearPrevGame(centOneSizeX, centOneSizeY);
        clearPrevGame(centTwoSizeX, centTwoSizeY);
    }
}

void clearPrevGame(ArrayList<Integer> playerX, ArrayList<Integer> playerY) {
    playerX.clear(); 
    playerY.clear();

    bananaX.clear();
    bananaY.clear();

    kersX.clear();
    kersY.clear();

    chameleonX.clear();
    chameleonY.clear();
    
    playerOneScore = 0;
    playerTwoScore = 0;

    addDefBodyparts(blocksX -2, centOneSizeX, centOneSizeY);
    addDefBodyparts(1, centTwoSizeX, centTwoSizeY);

    directionOne = 1;
    directionTwo = 1;

    players = 1;
    playerTurn = 1;
    playerMove = false;

    cantWalkGround("clear", 0, 0);

    gamescreen = "start screen";
}