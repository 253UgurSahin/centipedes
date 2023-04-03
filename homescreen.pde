// ----------------------------------------------
// Button Variables
// ----------------------------------------------
int buttonW = 80;
int buttonH = 25;
int defBtnX = width/2;
int defBtnY = height/3;
int buttonX;
int buttonY;

color btnColor = #deff12;
color btnTxtColor = #000000;

boolean mouseClick = (mouseButton == LEFT) && mousePressed;

// ----------------------------------------------
// home screen
// ----------------------------------------------
void homeScreen() {
    // ----------------------------------------------
    // Variables
    // ----------------------------------------------
    defBtnX = width/2;
    defBtnY = height/3;
    mouseClick = (mouseButton == LEFT) && mousePressed;

    // ----------------------------------------------
    // Playesr BTN
    // ----------------------------------------------
    setPlayers();

    // ----------------------------------------------
    // Bananas Button
    // ----------------------------------------------
    setBananas();

    // ----------------------------------------------
    // Variablesstart button
    // ----------------------------------------------
    startPlaying();
}

// ----------------------------------------------
// Set players buttons
// ----------------------------------------------
void setPlayers() {
    // ----------------------------------------------
    // Variables
    // ----------------------------------------------
    buttonY = defBtnY - buttonH;

    // ----------------------------------------------
    // Text
    // ----------------------------------------------
    String text = "Select players to start playing!";
    showText(CENTER, 20, 255, text, defBtnX, buttonY - 10);
    
    // ----------------------------------------------
    // 1 player
    // ----------------------------------------------
    buttonX = defBtnX - 100;
    drawButton(buttonX, buttonY, buttonW, buttonH, "1 Player", btnTxtColor, btnColor);
    if (mouseOverRect(buttonX, buttonY, buttonW, buttonH) && mouseClick) players = 1;

    // ----------------------------------------------
    // 2 players
    // ----------------------------------------------
    buttonX = defBtnX + 30;
    drawButton(buttonX, buttonY, buttonW, buttonH, "2 Player", btnTxtColor, btnColor);
    if (mouseOverRect(buttonX, buttonY, buttonW, buttonH) && mouseClick) players = 2;
}



// ----------------------------------------------
// Set banana Count
// ----------------------------------------------
void setBananas() {
    // ----------------------------------------------
    // Variables
    // ----------------------------------------------
    buttonY = defBtnY + 20 + buttonH;

    // ----------------------------------------------
    // Text
    // ----------------------------------------------
    String text = "Select banana count!";    
    showText(CENTER, 20, 255, text, defBtnX, buttonY - 10);

    // ----------------------------------------------
    // 5 bananen
    // ----------------------------------------------
    buttonX = defBtnX - buttonW*2 - 30;
    drawButton(buttonX, buttonY, buttonW, buttonH, "5 banana", btnTxtColor, btnColor);
    if (mouseOverRect(buttonX, buttonY, buttonW, buttonH) && mouseClick) maxBanana = 5;

    // ----------------------------------------------
    // 10 bananen
    // ----------------------------------------------
    buttonX = defBtnX - buttonW;
    drawButton(buttonX, buttonY, buttonW, buttonH, "10 banana", btnTxtColor, btnColor);
    if (mouseOverRect(buttonX, buttonY, buttonW, buttonH) && mouseClick) maxBanana = 10;

    // ----------------------------------------------
    // 15 bananen
    // ----------------------------------------------
    buttonX = defBtnX + 30;
    drawButton(buttonX, buttonY, buttonW, buttonH, "15 banana", btnTxtColor, btnColor);
    if (mouseOverRect(buttonX, buttonY, buttonW, buttonH) && mouseClick) maxBanana = 15;

    // ----------------------------------------------
    // 20 bananen
    // ----------------------------------------------
    buttonX = defBtnX + buttonW + 30*2;
    drawButton(buttonX, buttonY, buttonW, buttonH, "20 banana", btnTxtColor, btnColor);
    if (mouseOverRect(buttonX, buttonY, buttonW, buttonH) && mouseClick) maxBanana = 20;

        println(maxBanana);

}

// ----------------------------------------------
// Show play button
// ----------------------------------------------
void startPlaying() {
    // ----------------------------------------------
    // Variables
    // ----------------------------------------------
    buttonY = height - 80 - buttonH;

    // ----------------------------------------------
    // Text
    // ----------------------------------------------
    String text = "Press to start playing!";
    showText(CENTER, 20, 255, text, defBtnX, buttonY - buttonH);

    // ----------------------------------------------
    // Start btn
    // ----------------------------------------------
    buttonX = defBtnX - buttonW/2;
    drawButton(buttonX, buttonY, buttonW, buttonH, "Start Game", btnTxtColor, btnColor);
    if (mouseOverRect(buttonX, buttonY, buttonW, buttonH) && mouseClick) gamescreen = "loading";
}


// ----------------------------------------------
// home screen functions
// ----------------------------------------------
void drawButton(int rectX, int rectY, int rectW, int rectH, String text, color textColor, color rectColor) {
    fill(rectColor);
    rect(rectX, rectY, rectW, rectH, 18);

    showText(CENTER, 15, textColor, text, rectX + rectW/2, rectY + rectH/4 + rectH/2);
}


boolean mouseOverRect(int x, int y, int btnwidth, int btnheight)  {
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