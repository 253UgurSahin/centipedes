// // ----------------------------------------------
// // Chameleon
// // ----------------------------------------------
void chameleon() {

    chameleonEaten();

    // Draw food
    // displayFood(chameleonX, chameleonY, chameleonC);    
}

void chameleonEaten() {
    // new food on eaten || player one eaten kers
    if (foodEaten(centOneSizeX, centOneSizeY, chameleonX, chameleonY)) {
        removeItemIfEaten(centOneSizeX, centOneSizeY, chameleonX, chameleonY);

        centipedeBody("shorten", centOneSizeX, centOneSizeY, 1);
    }

    // player two eaten kers
    if (players == 2 && foodEaten(centTwoSizeX, centTwoSizeY, chameleonX, chameleonY)) {
        removeItemIfEaten(centTwoSizeX, centTwoSizeY, chameleonX, chameleonY);

        centipedeBody("shorten", centTwoSizeX, centTwoSizeY, 1);            
    }
}



int chameleonSpanCount() {
    int totalBlocks = blocksX * blocksY;                    // Total of all blocks
    int totalNotUsed = totalBlocks - takenBlocksX().size(); // returns Blocks not taken
    int totalToSpawn = (int) totalNotUsed / 100 * 10;       // total not used to only 10%;    

    return totalToSpawn;
}