public void plaintext_change(GTextField source, GEvent event) {}

public void omenum_change(GTextArea source, GEvent event) {}

public void encrypt_click(GButton source, GEvent event) {
  int len = plaintext.getText().length();
  int [] pasc = new int [len];
  String [] omnm = new String [len];
  if (omenum.getText() == "") {
    for (int i = 0; i < len; i++) {
      int temp = triangle.size()-1-i;
      omnm[i] = String.valueOf(temp);
      pasc[i] = temp;
    }
    String decryptStr = "";
    for (int i = 0; i < omnm.length; i++) {
      decryptStr += omnm[i];
      if (i != omnm.length-1) {
        decryptStr += ",";
      }
    }
    omenum.setText(decryptStr);
  }
  
  BigInteger [] ct = encrypter(plaintext.getText(), pasc);
  BigInteger result = new BigInteger("0");
  for (int i = 0; i < ct.length; i++) {
    result = result.add(ct[i]);
  }
  String res = "" + result;
  omenum.setText(res);
}

public void decrypt_click(GButton source, GEvent event) {}



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  if(frame != null)
    frame.setTitle("Sketch Window");
  plaintext = new GTextField(this, 10, 40, 130, 30, G4P.SCROLLBARS_NONE);
  plaintext.setOpaque(true);
  plaintext.addEventHandler(this, "plaintext_change");
  label1 = new GLabel(this, 35, 10, 80, 20);
  label1.setText("Input");
  label1.setOpaque(false);
  omenum = new GTextArea(this, 10, 110, 130, 50, G4P.SCROLLBARS_NONE);
  omenum.setOpaque(true);
  omenum.addEventHandler(this, "omenum_change");
  label2 = new GLabel(this, 35, 80, 80, 20);
  label2.setText("Output");
  label2.setOpaque(false);
  encrypt = new GButton(this, 20, 170, 110, 30);
  encrypt.setText("Encrypt");
  encrypt.addEventHandler(this, "encrypt_click");
}

// Variable declarations 
// autogenerated do not edit
GTextField plaintext; 
GLabel label1; 
GTextArea omenum; 
GLabel label2; 
GButton encrypt; 
GButton decrypt; 

