float ex = 0;
float ey = 0;
float bx = 0;
float by = 0;
int hp;
int score;
int gseq;
void setup(){
  size(600, 400);
  ex = random(600);
  hp = 20;
  score = 0;
}
void draw(){
  background(0);
  fill(255);
  rect(mouseX, mouseY, 30, 30);
  scoreDisp();
  gameOver();
  

  ey += 5;
  if(ey > 400){
     hp--;
     
    ex = random(600);
    ey = 0;
  }
  fill(255, 0, 0);
  ellipse(ex, ey, 30, 30);


  by -= 15;
  if(by < 0){
    bx = mouseX;
    by = mouseY;
  }
  fill(0, 0, 255);
  ellipse(bx, by, 12, 12);
  
  int hit = isHit(bx, by, 10, 10, ex, ey, 30, 30);
  if(hit == 1){
    score++;
    ex = random(600);
    ey = 0;
  }
}
int isHit(float px, float py, float pw, float ph, float ex, float ey, float ew, float eh){
  if(px < ex + ew && px + pw > ex){
    if(py < ey + eh && py + ph > ey){
      return 1;  
    }
  }
  
  
  return 0;
}
void scoreDisp(){
  textSize(24);
  fill(255);
  text("score:"+score,100,25);
  text("HP:"+hp,0,25);
  if(hp < 0){
    gseq = 1;
  }
}
void gameOver(){
  if(gseq == 0){
    
  }else if(gseq == 1){
    textSize(60);
    fill(255);
    text("score:"+score,50,250);
    text("GAME OVER",300,250);
    if(score < 10){
      textSize(30);
      text("NOOB",50,300);
      
    }else if(score >30){
       textSize(30);
      text("Thats the way to go",50,300);
    }
      
  }
}
