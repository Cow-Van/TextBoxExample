TextBox tb;

public void setup() {
  size(500, 500);
  
  tb = new TextBox(175, 250, 200, 50, 30, 5, 17, color(255, 255, 255), color(0, 0, 0), createFont("Georgia", 20));
}

public void draw() {
  background(#D3D3D3);
  tb.update();
}

public void keyPressed() {
  if (key == BACKSPACE) {
    tb.removeLastChar();
  } else {
    tb.appendChar(key);
  }
}


public class TextBox {
  private final ArrayList<Character> chars = new ArrayList();
  
  private float x;
  private float y;
  private float wid;
  private float hei;
  private float paddingTop;
  private float paddingLeft;
  private int maxChars;
  private color textColor;
  private color bgColor;
  private PFont font;
  
  public TextBox(float tbX, float tbY, float tbWidth, float tbHeight, float paddingTop, float paddingLeft, int maxCharacters, color tbTextColor, color tbBackgroundColor, PFont font) {
    this.x = tbX; // X-coordinate of the top left
    this.y = tbY; // Y-coordinate of the top left
    this.wid = tbWidth; // Width
    this.hei = tbHeight; // Height
    this.paddingTop = paddingTop; // How much space is between the top of the rectangle and the bottom of text
    this.paddingLeft = paddingLeft; // How much space is between the left of the rectangle and the left of text
    this.maxChars = maxCharacters; // Maximum amount of characters
    this.textColor = tbTextColor; // Text color
    this.bgColor = tbBackgroundColor; // Text box background color
    this.font = font; // Text font
  }
  
  // Redraws the text box
  public void update() {
    fill(bgColor);
    rect(x, y, wid, hei);
    
    fill(textColor);
    textFont(font);
    text(characterListToString(chars), x + paddingLeft, y + paddingTop);
  }
  
  // Adds char at given index (Note: current char at the `index` will now be at `index + 1`)
  public void addChar(int index, char character) {
    if (chars.size() <= maxChars) {
      chars.add(index, character);
    }
  }
  
  // Adds char to the end
  public void appendChar(char character) {
    addChar(chars.size(), character);
  }
  
  // Removes char at given index (Note: current char at `index + 1` will now be at `index`)
  public void removeChar(int index) {
    chars.remove(index);
  }
  
  // Removes last char
  public void removeLastChar() {
    removeChar(chars.size() - 1);
  }
  
  // Returns the current input in the text box
  public String getInput() {
    return characterListToString(chars);
  }

  // Converts list of chars to string
  private String characterListToString(ArrayList<Character> characterList) {
    String s = "";
    
    for (Character c : characterList) {
      s += c;
    }
    
    return s;
  }
}
