//Ludumdare game test thingy
int health;
int gold;
int attack;
int defence;
int currentEvent;
ArrayList<Button> buttonArray;
ArrayList<String> eventArray;
String choice1, choice2, choice3, choice4;

String roomName, roomDesc, enemyName, eventDesc;
Boolean isEnemy;
Boolean yourTurn;
int enemyHealth,enemyGold,enemyAttack,enemyDefence;

void settings() {
  fullScreen();
}
void setup() {
  background(50,40,45);
  
  health = 3;
  gold = 0;
  attack = 1;
  defence = 0;
  if(int(random(1))==1) yourTurn = true;
  else yourTurn = false;
  
  enemyHealth = 3;
  enemyGold = 0;
  enemyAttack = 1;
  enemyDefence = 0;
  isEnemy = false;
  
  choice1 = "Choice 1";
  choice2 = "Choice 2";
  choice3 = "Choice 3";
  choice4 = "Choice 4";
  
  eventArray = new ArrayList<String>();
  //eventArray.add(new Event("You begin your journey into the tower...","Proceed..."));
  eventArray.add("You begin your journey into the tower...");
  eventArray.add("There is nothing in this room");
  eventArray.add("You found a chest");
  eventArray.add("You found a small health item");
  eventArray.add("You found a large health item");
  eventArray.add("You found a piece of gold");
  eventArray.add("You found gold");
  eventArray.add("You found a small weapon");
  eventArray.add("You found a large weapon");
  eventArray.add("You found a small piece of armour");
  eventArray.add("You found a large piece of armour");
  eventArray.add("It was a weak trap");
  eventArray.add("It was a deadly trap");
  eventArray.add("You found a monster");
  eventArray.add("The monster attacks you");
  eventArray.add("You attack the monster");
  eventArray.add("You have passed away");
  eventArray.add("You killed the monster");
  eventArray.add("You enter a small room made of wood");
  eventArray.add("You enter a large room made of wood");
  eventArray.add("You enter a small room made of stone");
  eventArray.add("You enter a large room made of stone");
  eventArray.add("You enter a large cathedral hall");
  eventArray.add("You enter a library");
  eventArray.add("You enter a small corridor");
  eventArray.add("You find three cups, Pick one!");
  eventArray.add("You picked the 1st Cup");
  eventArray.add("You picked the 2nd Cup");
  eventArray.add("You picked the 3rd Cup");
  currentEvent=0;
  
  buttonArray = new ArrayList<Button>();
  buttonArray.add(new Button("Choice 1",choice1, 0, 0, width/4, height/4));
  buttonArray.add(new Button("Choice 2",choice2, width/4, 0, width/4, height/4));
  buttonArray.add(new Button("Choice 3",choice3, 0, height/4, width/4, height/4));
  buttonArray.add(new Button("Choice 4",choice4, width/4, height/4, width/4, height/4));
  
  buttonArray.add(new Button("Health","Health: "+health, width/2, 0, width/2, height/4));
  buttonArray.add(new Button("Gold", "Gold: "+gold, width/2, height/4, width/2, height/4));
  buttonArray.add(new Button("Attack","Attack: "+attack, width/2, height/2, width/4, height/4));
  buttonArray.add(new Button("Defence","Defence: "+defence, width/2+width/4, height/2, width/4, height/4));
  
  buttonArray.add(new Button("Enemy","Enemy: "+enemyName+"\nAttack: "+enemyAttack+"\nGold: "+enemyGold+"\nAttack: "+enemyAttack+"\nDefence: "+enemyDefence, 0, height/4*2, width/4, height/2));
  buttonArray.add(new Button("Room","Room: "+roomName+"\n"+roomDesc, width/4, height/2, width/4, height/2));
  buttonArray.add(new Button("Event",eventArray.get(0), width/2, height/2+height/4, width/2, height/4));
  
  textSize(50);
  
  for (int i=buttonArray.size()-1; i>=0; i--) {
      Button button = buttonArray.get(i);
      button.visible = true;
      button.onePress = true;
  }
  
  updateEvent(currentEvent);
  
}

void draw() {
  background(50,40,45);
  for(int i=0; i<buttonArray.size(); i++) {
    if(i==4) buttonArray.get(i).setText("Health: "+health);
    if(i==5) buttonArray.get(i).setText("Gold: "+gold);
    if(i==6) buttonArray.get(i).setText("Attack: "+attack);
    if(i==7) buttonArray.get(i).setText("Defence: "+defence);
    if(i==8) buttonArray.get(i).setText("Enemy: "+enemyName+"\nAttack: "+enemyAttack+"\nGold: "+enemyGold+"\nAttack: "+enemyAttack+"\nDefence: "+enemyDefence);
    if(i==8&&!isEnemy) buttonArray.get(i).setVisible(false);
    buttonArray.get(i).update();
  }
  fill(255,255,255,50);
  
  rect(width/2,0,width/2,height);
  
}

void mousePressed() {
  for (int i=buttonArray.size()-1; i>=0; i--) {
      Button button = buttonArray.get(i);
      button.onMouseClick();
   }
}

void onButtonClick(String eventID) {
  if(currentEvent==0) {
    if(eventID.equals("Choice 1")) randomEvent();
  }
  else if(currentEvent==1) {
    if(eventID.equals("Choice 1")) randomEvent();
  }
  else if(currentEvent==2) {
    if(eventID.equals("Choice 1")) currentEvent = int(random(3,4));
  }
  else if(currentEvent==3) {
    if(eventID.equals("Choice 1")) {
      health++;
      randomEvent();
    }
  }
  else if(currentEvent==4) {
    if(eventID.equals("Choice 1")) {
      health+=3;
      randomEvent();
    }
  }
  else if(currentEvent==5) {
    if(eventID.equals("Choice 1")) {
      gold++;
      randomEvent();
    }
  }
  else if(currentEvent==6) {
    if(eventID.equals("Choice 1")) {
      gold+=3;
      randomEvent();
    }
  }
  else if(currentEvent==7) {
    if(eventID.equals("Choice 1")) {
      attack++;
      randomEvent();
    }
  }
  else if(currentEvent==8) {
    if(eventID.equals("Choice 1")) {
      attack+=3;
      randomEvent();
    }
  }
  else if(currentEvent==9) {
    if(eventID.equals("Choice 1")) {
      defence++;
      randomEvent();
    }
  }
  else if(currentEvent==10) {
    if(eventID.equals("Choice 1")) {
      defence+=3;
      randomEvent();
    }
  }
  else if(currentEvent==11) {
    if(eventID.equals("Choice 1")) {
      health--;
      randomEvent();
    }
  }
  else if(currentEvent==12) {
    if(eventID.equals("Choice 1")) {
      health-=3;
      randomEvent();
    }
  }
  else if(currentEvent==13) {
    if(eventID.equals("Choice 1")) {
      if(yourTurn) currentEvent = 14;
      else currentEvent = 15;
    }
  }
  else if(currentEvent==14) {
    if(eventID.equals("Choice 1")) {
      if(enemyHealth>0) {
        //enemyHealth-=attack;
        int finalDamage = attack-enemyDefence;
        if(finalDamage<=0) finalDamage = 1;
        enemyHealth-=finalDamage;
      }
      if(enemyHealth<=0) currentEvent = 17;
      else currentEvent = 15;
    }
  }
  else if(currentEvent==15) {
    if(eventID.equals("Choice 1")) {
      if(health>0) {
        //health-=enemyAttack;
        int finalDamage = enemyAttack-defence;
        if(finalDamage<=0) finalDamage = 1;
        health-=finalDamage;
      }
      if(health<=0) currentEvent = 16;
      else currentEvent = 14;
    }
  }
  else if(currentEvent==16) {
    if(eventID.equals("Choice 1")) {
      //exit();
    }
  }
  else if(currentEvent==17) {
    if(eventID.equals("Choice 1")) {
      isEnemy = false;
      randomEvent();
    }
  }
  else if(currentEvent==18) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==19) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==20) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==21) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==22) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==23) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==24) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==25) {
    if(eventID.equals("Choice 1")) {
      currentEvent = 26;
    }
    else if(eventID.equals("Choice 2")) {
      currentEvent = 27;
    }
    else if(eventID.equals("Choice 3")) {
      currentEvent = 28;
    }
  }
  else if(currentEvent==26) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==27) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  else if(currentEvent==28) {
    if(eventID.equals("Choice 1")) {
      randomEvent();
    }
  }
  if(health<=0) currentEvent = 16;
  updateEvent(currentEvent);
}

void updateEvent(int eventID) {
  if(eventID==0) {
    buttonArray.get(0).setText("Proceed");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==1) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==2) {
    buttonArray.get(0).setText("Open it");
    buttonArray.get(1).setText("Leave it and proceed to the next room");
    buttonArray.get(1).setVisible(true);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==3) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==4) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==5) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==6) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==7) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==8) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==9) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==10) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==11) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==12) {
    buttonArray.get(0).setText("Proceed to next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  else if(eventID==12) {
    buttonArray.get(0).setText("Proceed to Battle");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
    isEnemy = true;
    if(int(random(1))==1) yourTurn = true;
  }
  else if(eventID==13) {
    buttonArray.get(0).setText("Continue to Battle");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==14) {
    buttonArray.get(0).setText("Continue to Battle");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==15) {
    buttonArray.get(0).setText("Continue to Battle");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==16) {
    buttonArray.get(0).setText("You have died");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==17) {
    buttonArray.get(0).setText("Proceed to the next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==18) {
    buttonArray.get(0).setText("Examine the room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==19) {
    buttonArray.get(0).setText("Examine the room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==20) {
    buttonArray.get(0).setText("Examine the room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==21) {
    buttonArray.get(0).setText("Examine the room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==22) {
    buttonArray.get(0).setText("Examine the room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==23) {
    buttonArray.get(0).setText("Examine the room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==24) {
    buttonArray.get(0).setText("Examine the room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==25) {
    buttonArray.get(0).setText("Pick 1st Cup");
    buttonArray.get(1).setText("Pick 2nd Cup");
    buttonArray.get(2).setText("Pick 3rd Cup");
    buttonArray.get(1).setVisible(true);
    buttonArray.get(2).setVisible(true);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==26) {
    buttonArray.get(0).setText("Proceed to the next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==27) {
    buttonArray.get(0).setText("Proceed to the next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
  else if(eventID==28) {
    buttonArray.get(0).setText("Proceed to the next room");
    buttonArray.get(1).setVisible(false);
    buttonArray.get(2).setVisible(false);
    buttonArray.get(3).setVisible(false);
    buttonArray.get(10).setText(eventArray.get(eventID));
  }
  
}

void randomEvent() {
  currentEvent = int(random(eventArray.size()));
  if(currentEvent>=14&&currentEvent<=16) randomEvent();
  if(currentEvent==0) randomEvent();
}