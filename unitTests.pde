// ----------------------------------------------
// Unit Test
// // ----------------------------------------------
void unitTest() {
    ArrayList<Integer> textX = new ArrayList<Integer>();
    ArrayList<Integer> textY = new ArrayList<Integer>();

    // fill test array
    for (int i = -1; i < 10; i++) textX.add(i);
    for (int i = 10; i > -1; i--) textY.add(i);

    
    println("testChameleonSpanCount: " + testChameleonSpanCount());                         // Expected value 60
    println("testMouseOverRect: " + testMouseOverRect(width/2, height/2, 80, 80));          // Expected value true if you hover on center of screen else false
    println("testOutOfBoard: " + testOutOfBoard(textX, textY));                             // Expected value True

}


// ----------------------------------------------
// 10 procent van alle blokken
// ----------------------------------------------
int testChameleonSpanCount() {
    int totalBlocks = 25 * 25;                              // Total of all blocks
    int totalNotUsed = totalBlocks - 25;                    // returns Blocks not taken
    int totalToSpawn = (int) totalNotUsed / 100 * 10;       // total not used to only 10%;    

    return totalToSpawn;
}


// ----------------------------------------------
// mouseover button
// ----------------------------------------------
boolean testMouseOverRect(int x, int y, int btnwidth, int btnheight)  {
    if  (
            mouseX >= x && mouseX <= x + btnwidth && 
            mouseY >= y && mouseY <= y + btnheight
        ) 
    {
        return true;
    } else {
        return false;
    }
}


// ----------------------------------------------
// Out of board
// ----------------------------------------------
boolean testOutOfBoard(ArrayList<Integer> playerX, ArrayList<Integer> playerY) {
    boolean state = false;

    if (playerX.get(0) < 0 || playerY.get(0) < 0 || playerX.get(0) >= blockWH || playerY.get(0) >= blockWH) {
        state = true;
    }

    return state;
}