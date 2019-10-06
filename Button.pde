class Button {
  String id; //Identifier
  String text;
  int x,y,w,h; //Position and Size
  boolean visible; //If true, this button is displayed and clickable
  boolean activated; //If Clicked
  boolean wasPressed;
  boolean dropdown; //If true, all direct children of
  ArrayList<Button> dropdownList;
  color normal, hover, pressed; //Colors for non-image button
  boolean onePress;
  
  Button() {
    id="";
    text="";
    x=0;
    y=0;
    w=10;
    h=10;
    visible=false;
    wasPressed = false;
    dropdown=false;
    dropdownList = new ArrayList<Button>();
    normal=color(255);
    hover=color(180);
    pressed=color(90);
  }
  
  Button(String _id,String _text,int _x,int _y,int _w,int _h) {
    id=_id;
    text=_text;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    visible=false;
    wasPressed = false;
    dropdown=false;
    dropdownList = new ArrayList<Button>();
    normal=color(200);
    hover=color(150);
    pressed=color(70);
  }
  
  void update() {
    if(visible) {
      if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h||activated) {
        if(wasPressed){
          fill(pressed);
          rect(x,y,w,h);
          wasPressed = false;
        } else {
          fill(hover);
          rect(x,y,w,h);
        }
      } else {
        fill(normal);
        rect(x,y,w,h);
      }
      fill(10);
      text(text,x,y,w,h);
      //text(id,x,y,w,h);
      
      //Sends update() to all children if dropdown
      if(dropdown) {
        for(int i=0; i<dropdownList.size(); i++) {
          dropdownList.get(i).update();
        }
      }
    }
  }
  
  void onMouseClick() {
    if(visible) {
      if(mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
        isPressed();
      }
      //Sends onClickEvent() to all children
      if(dropdown) {
        for(int i=0; i<dropdownList.size(); i++) {
          dropdownList.get(i).onMouseClick();
        }
      }
    }
  }
  
  void isPressed() {
    wasPressed = true;
    if(!onePress)activated=!activated;
    if(dropdown) {
      for(int i=0; i<dropdownList.size(); i++) {
        if(activated) dropdownList.get(i).visible=true;
        else dropdownList.get(i).visible=false;
      }
    }
    else
      onButtonClick(id);
  }
  
  void addDropdownButton(String _id,String _text, int _x,int _y,int _w,int _h) {
    if(!dropdown)
      dropdown=true;
    dropdownList.add(new Button(_id,_text,_x,_y,_w,_h));
    //dropdownList.get(dropdownList.size()-1).visible = true;
  }
  
  void setText(String newText) {
    text = newText;
  }
  
  void setVisible(Boolean v) {
    visible = v;
  }
}