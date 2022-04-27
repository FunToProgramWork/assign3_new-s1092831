final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24;
PImage lifeImg,stone1;
PImage soil0,soil1,soil2,soil3,soil4,soil5;
PImage groundhogIdle;
PImage soldierImg;
PImage cabbage;
int x = 0;
// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  lifeImg= loadImage("img/life.png");
  stone1= loadImage("img/stone1.png");
  groundhogIdle= loadImage("img/groundhogIdle.png");
  soldierImg = loadImage("img/soldier.png");
  cabbage = loadImage("img/cabbage.png");
}

void draw() {
  
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		image(soil8x24, 0, 160);
    image(soil1, 0, 480);
    image(soil1, 80, 480);
    image(soil1, 160, 480);
    image(soil1, 240, 480);
    image(soil1, 320, 480);
    image(soil1, 400, 480);
    image(soil1, 480, 480);
    image(soil1, 560, 480);
    //
    image(soil1, 0, 560);
    image(soil1, 80, 560);
    image(soil1, 160, 560);
    image(soil1, 240, 560);
    image(soil1, 320, 560);
    image(soil1, 400, 560);
    image(soil1, 480, 560);
    image(soil1, 560, 560);
    //
    image(soil1, 0, 640);
    image(soil1, 80, 640);
    image(soil1, 160, 640);
    image(soil1, 240, 640);
    image(soil1, 320, 640);
    image(soil1, 400, 640);
    image(soil1, 480, 640);
    image(soil1, 560, 640);
    //
    image(soil1, 0, 720);
    image(soil1, 80, 720);
    image(soil1, 160, 720);
    image(soil1, 240, 720);
    image(soil1, 320, 720);
    image(soil1, 400, 720);
    image(soil1, 480, 720);
    image(soil1, 560, 720);
    //
    
    image(stone1,0, 160);
    image(stone1,80, 240);
    image(stone1,160,320);
    image(stone1,240,400);
    image(stone1,320,480);
    image(stone1,400,560);
    image(stone1,480,640);
    image(stone1,560,720);
		// Player
    image(groundhogIdle,320,80);
      image(soldierImg,x,160);
  x=x+1;
  if (x> 640)
  x = -80;
  image(cabbage,80,320);

		// Health UI
  image(lifeImg,10,10);
  image(lifeImg,80,10);

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
    
}

void keyPressed(){
	// Add your moving input code here

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
