import g4p_controls.*;
import java.util.ArrayList;
import java.math.*;

static BigInteger one = new BigInteger("1");
public static ArrayList<ArrayList<BigInteger>> triangle;

void setup () {
  size(150, 240);
  createGUI();
  triangle = genPyrN(100);
}

void draw () {
  background(255);
}

public static ArrayList<ArrayList<BigInteger>> genPyrN(int rows){
  ArrayList<ArrayList<BigInteger>> tri = new ArrayList<ArrayList<BigInteger>>();
  //save the last row here
  ArrayList<BigInteger> last = new ArrayList<BigInteger>();
  last.add(one);
  //System.out.println(last);
  for(int i= 1;i <= rows;++i){
    //work on the next row
    ArrayList<BigInteger> thisRow= new ArrayList<BigInteger>();
    thisRow.add(last.get(0)); //beginning
    for(int j= 1;j < i;++j){//loop the number of elements in this row
      //sum from the last row
      thisRow.add(last.get(j - 1).add(last.get(j)));
    }
    thisRow.add(last.get(0)); //end
    last= thisRow;//save this row
    //System.out.println(thisRow);
    tri.add(thisRow);
  }
  return tri;
}

public static int letterToAlpha (char letter) {
  return Character.getNumericValue(letter)-9;
}

public static BigInteger [] encrypter (String pt, int [] pasc) {
  BigInteger [] plain = new BigInteger [pt.length()];
  BigInteger [] cipher = new BigInteger [pt.length()];
  for (int i = 0; i < pt.length(); i++) {
    int temp = letterToAlpha(pt.charAt(i));
    plain[i] = new BigInteger(str(temp)); 
  }
  
  for (int i = 0; i < plain.length; i++) {
    BigInteger temp = plain[i];
    int len = triangle.get(pasc[i]).size();
    for (int j = 0; j < len; j++) {
      temp = temp.multiply(triangle.get(pasc[i]).get(j));
    }
    cipher[i] = temp; 
  }
  
  BigInteger temp = cipher[0];
  
  for (int i = 0; i < cipher.length-1; i++) {
    cipher[i] = cipher[i].multiply(cipher[i+1]);
  }
  
  cipher[cipher.length-1] = cipher[cipher.length-1].multiply(temp);
  
  return cipher;
}








