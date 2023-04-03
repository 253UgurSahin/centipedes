// ----------------------------------------------
// Variables
// ----------------------------------------------
// snake variables
ArrayList<Integer> centOneSizeX = new ArrayList<Integer>();
ArrayList<Integer> centOneSizeY = new ArrayList<Integer>();

ArrayList<Integer> centTwoSizeX = new ArrayList<Integer>();
ArrayList<Integer> centTwoSizeY = new ArrayList<Integer>();

int centipedeDefLength = 10;

int speed = 7;

int players = 1;
int playerTurn = 1;
boolean playerMove = false;

int playerOneScore = 0;
int playerTwoScore = 0;

color playerOneColor = #00ff00;
color playerTwoColor = #0000ff;

int     directionOne = 1; 
int     directionTwo = 1; 

int[]   xDirection = {0, 0, 1, -1}; 
int[]   yDirection = {1, -1, 0, 0};


// board variables
int blockWH = 25;
int blocksX = blockWH;
int blocksY = blockWH;
int w   = blockWH * blocksX;
int h   = blockWH * blocksY;


// Cant walk on here anymore
ArrayList<Integer> cantWalkGroundX = new ArrayList<Integer>();
ArrayList<Integer> cantWalkGroundY = new ArrayList<Integer>();

// Screen
String gamescreen = "start screen";


// food variables
ArrayList<Integer> bananaX = new ArrayList<Integer>(); // banaan x coordinates
ArrayList<Integer> bananaY = new ArrayList<Integer>(); // banaan x coordinates


ArrayList<Integer> kersX = new ArrayList<Integer>(); // chameleon x coordinates
ArrayList<Integer> kersY = new ArrayList<Integer>(); // chameleon x coordinates

int foodBanaanScore = 10;
int foodKersScore = 5;

int maxBanana = 20; // banaan max
int maxKers = 1; // kers max

color bananaC = #DBFF33;
color kersC = #FF5733;


// Kameleon
ArrayList<Integer> chameleonX = new ArrayList<Integer>(); // chameleon x coordinates
ArrayList<Integer> chameleonY = new ArrayList<Integer>(); // chameleon x coordinates

int totalChameleon = 15;

color chameleonC = #33FFBD;


// ----------------------------------------------
// Setup
// ----------------------------------------------
void settings() {
    size(w, h);
}

void setup() {
    // Centipede start positions
    addDefBodyparts(blocksX -2, centOneSizeX, centOneSizeY);
    addDefBodyparts(1, centTwoSizeX, centTwoSizeY);
}   



void draw() {
    background(#191919);

    // ----------------------------------------------
    // unit test results every 4 secconds
    // ----------------------------------------------
    if (frameCount % 240 == 0)
        unitTest();

    // ----------------------------------------------
    // Homescreen
    // ----------------------------------------------
    if (gamescreen == "start screen") {
        homeScreen();
    }

    // ----------------------------------------------
    // loading
    // ----------------------------------------------
    else if (gamescreen == "loading") {
        loading();
    }
    

    // ----------------------------------------------
    // starting
    // ----------------------------------------------
    else if (gamescreen == "starting" || gamescreen == "playing") {
        if (gamescreen == "starting") {
            String text = "Press arrow keys to start player one!";
            showText(CENTER, 20, 255, text, width/2, height/3 -20);
        }

        // draw block which you may not touch
        if (players == 2) cantWalkGround("draw", 0, 0);

        
        // Kers
        kers();
        // Banana
        banana();

        // chameleon
        chameleon();

        // draw player 1
        centipede(
            centOneSizeX, 
            centOneSizeY, 
            playerOneColor, 
            width - 65, 
            playerOneScore,
            (playerTurn == 1 && playerMove),
            directionOne
        );

        // draw player 2
        if (players == 2) { 
            centipede(
                centTwoSizeX, 
                centTwoSizeY, 
                playerTwoColor, 
                65, 
                playerTwoScore,
                (playerTurn == 2 && playerMove),
                directionTwo
            );
        }
    }

    // ----------------------------------------------
    // Game over
    // ----------------------------------------------
    else if (gamescreen == "gameover") {
        gameOver();
    }
}



// ----------------------------------------------
// Movement
// ----------------------------------------------
void keyPressed() { 
    // player 1 movement
    switch (keyCode) {
        case DOWN:  playerMovement(0); break;
        case UP:    playerMovement(1); break;
        case RIGHT: playerMovement(2); break;
        case LEFT:  playerMovement(3); break;   
    }

    // player 2 movement
    if (players == 2 && playerTurn == 2) 
        switch (key) {
            case 's':   playerMovement(0); break;
            case 'w':   playerMovement(1); break;
            case 'd':   playerMovement(2); break;
            case 'a':   playerMovement(3); break;
        }    
}


void playerMovement(int dir) {
    if (gamescreen == "starting") gamescreen = "playing"; // change gamescreen if needed
    
    if (players == 1) playerTurn = 1; // if 1 player, set playerturn to 1

    playerMove = true; // Player may move now    

    if (playerTurn == 1)    directionOne = checkDir(directionOne, dir); 
    else                    directionTwo = checkDir(directionTwo, dir);
}


int checkDir(int oldDir, int newDir) {
    if (oldDir == 3 && newDir == 2) return oldDir;
    else if (oldDir == 2 && newDir == 3) return oldDir;
    else if (oldDir == 0 && newDir == 1) return oldDir;
    else if (oldDir == 1 && newDir == 0) return oldDir;
    else return newDir;
}